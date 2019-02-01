import 'package:flutter/material.dart';

//类型定义
typedef Future<List<T>> PageRequest<T>(int page, int pageSize);
typedef Widget ItemBuilder<T>(List<T> list, int position);

class BaseListView<T> extends StatefulWidget {
  PageRequest<T> pageRequest;
  ItemBuilder<T> itemBuilder;
  int pageSize;
  int page;
  bool enableLoadmore;
  bool enableRefresh;
  bool hasHeader;
  Widget header;
  int total = 25;

  BaseListView(this.pageRequest, this.itemBuilder,
      {this.pageSize = 20,
        this.page = 0,
        this.enableLoadmore = false,
        this.enableRefresh = true,
        this.hasHeader = false,
        this.header,
        this.total = 25});

  @override
  State<StatefulWidget> createState() => new _BaseListViewState<T>();

//  todo:有问题
//  //比如当没有更多客源加载的时候，就可以设置enableLoadmore为false
//  void setEnalbeLoadMore(bool enableLoadmore) {
//    this.enableLoadmore = enableLoadmore;
//  }
//
//  void setTotal(int total) {
//    this.total = total;
//  }
}

class _BaseListViewState<T> extends State<BaseListView<T>> {
  List<T> _list = new List();

  ScrollController controller;
  bool isLoading = false; //是否正在加载数据的标志

  //这个future是用来给FutureBuilder进行获取数据的，另一个方面是可以避免没必要的重绘
  Future future;

  FutureBuilder<List<T>> futureBuilder;

  @override
  void initState() {
    future = loadData(widget.page, widget.pageSize);
    futureBuilder = buildFutureBuilder();

    /**这部分代码主要是设置滑动监听，滑动到距离底部100单位的时候，开始进行loadmore操作
        如果controller.position.pixels==controller.position.maxScrollExtent再去
        进行loadmore操作的话，实际的显示和操作会有点奇怪，所以这里设置距离底部100
     */
    controller = new ScrollController();
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 100) {
        if (!isLoading) {
          isLoading = true;
          loadmore();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO：问题：赋值给一个变量的话，会导致setState无法更新的问题
    //不赋值给变量的话，外部的setState会导致列表也会跟着setState
    //暂时的解决方法：每次refresh和loadmore的时候重新赋值futurebuilder，
    // 这样可以刷新。并且外部其他进行setState的时候，内部并不会跟着进行没必要的刷新
    return futureBuilder;
  }

  /**
   * 构造FutureBuilder
   */
  FutureBuilder<List<T>> buildFutureBuilder() {
    return new FutureBuilder<List<T>>(
      builder: (context, AsyncSnapshot<List<T>> async) {
        if (async.connectionState == ConnectionState.active ||
            async.connectionState == ConnectionState.waiting) {
          isLoading = true;
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
        if (async.connectionState == ConnectionState.done) {
          isLoading = false;
          if (async.hasError) {
            //有错误的时候
            return new RetryItem(() {
              refresh();
            });
          } else if (!async.hasData) {
            //返回值为空的时候
            return new EmptyItem(() {
              refresh();
            });
          } else if (async.hasData) {
            //如果是刷新的操作
            if (widget.page == 0) {
              _list.addAll(async.data);
            }
            if (widget.total > 0 && widget.total <= _list.length) {
              widget.enableLoadmore = false;
            } else {
              widget.enableLoadmore = true;
            }

            debugPrint(
                "loadData hasData:page:${widget.page},pageSize:${widget.pageSize},list:${_list.length}");

            //计算最终的list长度
            int length = _list.length + (widget.hasHeader ? 1 : 0);

            return new RefreshIndicator(
                child: new ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: widget.enableLoadmore ? controller : null,
                  itemBuilder: (context, index) {
                    //可以加载更多的时候，最后一个item显示菊花
                    if (widget.enableLoadmore && index == length) {
                      return new LoadMoreItem();
                    }
                    return widget.itemBuilder(_list, index);
                  },
                  itemCount: length + (widget.enableLoadmore ? 1 : 0),
                  separatorBuilder: (BuildContext context, int index) {
                    return new Divider();
                  },
                ),
                onRefresh: refresh);
          }
        }
      },
      future: future,
    );
  }

  Future refresh() async {
    debugPrint("loadData:refresh,list:${_list.length}");
    if (!widget.enableRefresh) {
      return;
    }
    if (isLoading) {
      return;
    }

    _list.clear();
    setState(() {
      isLoading = true;
      widget.page = 0;
      future = loadData(widget.page, widget.pageSize);
      futureBuilder = buildFutureBuilder();
    });
  }

  void loadmore() async {
    debugPrint("loadData:loadmore,list:${_list.length}");
    loadData(++widget.page, widget.pageSize).then((List<T> data) {
      setState(() {
        isLoading = false;
        _list.addAll(data);
        futureBuilder = buildFutureBuilder();
      });
    });
  }

  Future<List<T>> loadData(int page, int pageSize) async {
    debugPrint("loadData:page:$page,pageSize:$pageSize,list:${_list.length}");
    return await widget.pageRequest(page, pageSize);
  }
}

class LoadMoreItem extends StatefulWidget {
  @override
  _LoadMoreItemState createState() => new _LoadMoreItemState();
}

class _LoadMoreItemState extends State<LoadMoreItem> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}

class RetryItem extends StatelessWidget {
  GestureTapCallback ontap;

  RetryItem(this.ontap);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Center(
          child: new Text("加载出错,点击重试"),
        ),
        onTap: ontap);
  }
}

class EmptyItem extends StatelessWidget {
  GestureTapCallback ontap;

  EmptyItem(this.ontap);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Center(
          child: new Text("列表数据为空"),
        ),
        onTap: ontap);
  }
}