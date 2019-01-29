import 'package:flutter/material.dart';

class EasyBadgeCard extends StatefulWidget {
  final Function onTap;
  final Color leftBadge;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final String title;
  final String description;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Color backgroundColor;
  final Color titleColor;
  final Color descriptionColor;
  final Color rightBadge;

  const EasyBadgeCard(
      {Key key,
      this.onTap,
      this.title,
      this.description,
      this.leftBadge,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconColor,
      this.prefixIconColor,
      this.backgroundColor,
      this.descriptionColor,
      this.titleColor,
      this.rightBadge})
      : super(key: key);

  @override
  EasyBadgeCardState createState() {
    return new EasyBadgeCardState();
  }
}

class EasyBadgeCardState extends State<EasyBadgeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: (this.widget.backgroundColor != null)
            ? this.widget.backgroundColor
            : Colors.white,
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            (this.widget.leftBadge != null)
                ? Container(
                    width: (this.widget.backgroundColor != null) ? 80.0 : 100.0,
                    height: 60.0,
                    color: this.widget.leftBadge,
                    alignment: Alignment.topRight,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: (this.widget.prefixIcon != null)
                              ? Icon(
                                  this.widget.prefixIcon,
                                  color: this.widget.prefixIconColor,
                                )
                              : Container(),
                        ),
                        (this.widget.backgroundColor == null && widget.leftBadge != null)
                            ? Image(
                                height: 60.0,
                                image: AssetImage(
                                    "assets/images/triangle_left.png"),
                              )
                            : Container(),
                      ],
                    ),
                  )
                : Container(),
            (this.widget.backgroundColor != null && widget.leftBadge != null)
                ? Image.asset(
                    "assets/images/triangle_inv_left.png",
                    height: 60.0,
                  )
                : Container(),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (this.widget.title != null)
                        ? Container(
                            child: Text(
                              this.widget.title,
                              style: TextStyle(
                                  color: (this.widget.titleColor != null)
                                      ? this.widget.titleColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          )
                        : Container(),
                    (this.widget.description != null)
                        ? Container(
                            child: Text(
                              this.widget.description,
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 10.0,
                                  color: (this.widget.descriptionColor != null)
                                      ? this.widget.descriptionColor
                                      : Colors.grey),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            (this.widget.suffixIcon != null && this.widget.rightBadge == null)
                ? Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: this.widget.onTap,
                      child: Icon(
                        this.widget.suffixIcon,
                        color: (this.widget.suffixIconColor != null)
                            ? this.widget.suffixIconColor
                            : Colors.black,
                      ),
                    ),
                  )
                : Container(),
            (this.widget.backgroundColor != null && this.widget.rightBadge != null)
                ? Image(
                    height: 60.0,
                    image: AssetImage("assets/images/triangle_inv_right.png"),
                  )
                : Container(),
            (this.widget.rightBadge != null)
                ? Container(
                    width: (this.widget.backgroundColor != null) ? 80.0 : 100.0,
                    height: 60.0,
                    color: this.widget.rightBadge,
                    alignment: Alignment.topRight,
                    child: Row(
                      children: <Widget>[
                        (this.widget.backgroundColor == null)
                            ? Image(
                                height: 60.0,
                                image: AssetImage(
                                    "assets/images/triangle_right.png"),
                              )
                            : Container(),
                        Expanded(
                          flex: 1,
                          child: (this.widget.suffixIcon != null)
                              ? Icon(
                                  this.widget.suffixIcon,
                                  color: this.widget.suffixIconColor,
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
