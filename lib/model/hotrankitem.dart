
class RankItem {
  String order;
  String rise;
  String title;
  String mark;
  String hotNum;
  String imgUrl;

  RankItem(this.order, this.title, this.hotNum, this.imgUrl, {this.mark, this.rise});
}

List<RankItem> itemList = [
  new RankItem("01", "如何看待北电表演学院院长张辉与10级毕业生结婚，用北电资金投资电影《一纸婚约》，并使张一山等作配一事？", "2518 万热度", "https://pic3.zhimg.com/80/v2-63cd9ba90912622409f414b17646b9aa_400x224.jpg"),
  new RankItem("02", "如何看待吴京成为中国首个百亿影帝?", "1159 万热度", "https://pic4.zhimg.com/80/v2-4aedaf835a1e7fd131a965ee372919b7_400x224.jpg", rise: "3", mark: "实至名归"),
  new RankItem("03", "如何看待豆瓣 App 在各大应用商店被疯狂打一星？", "958 万热度", "https://pic4.zhimg.com/50/v2-14383aa3b40ff3c0ebf0bc0eb56d8ae2_400x224.jpg", mark: "普遍反应的问题是改变评论星级之后赞数不会有变化，可能会被恶意用户利用故意先打高星吸引点赞，事后再编辑评论改为低星造成舆论假象。类似的行为在Steam等平台上已通过更改评论态度(好评改差评)后赞数清零等方式加以防范。"),
  new RankItem("04", "什么能力很重要，但大多数人却没有？", "837 万热度", "https://pic4.zhimg.com/80/v2-3198ab5e5f0ee97821e1e164b469ed1f_400x224.jpg", mark: "内核？呵呵"),
  new RankItem("05", "为什么今年（2019年）过年电影票价这么贵？", "695 万热度", "https://pic2.zhimg.com/50/v2-85124dfdfa631db48e0b954ef66a4ef4_400x224.jpg",rise: "3", mark: "我家是安徽芜湖的，一个三线小城市，去年电影票也就二三十块钱（市中心的电影院），我记得我去年大年初一还看过19.9的电影，也是在市中心的。今天打开淘票票，简直吓死我了，根本看不起，票价都是五六十往上飙！！！ 为啥今年电影票这么贵！！")
];