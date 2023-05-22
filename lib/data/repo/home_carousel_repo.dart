import '../model/home_carousel_model.dart';

class HomeCarouselRepo {
  List<HomeCarouselModel> getData() {
    return [
      HomeCarouselModel(
        imgSrc:
            'https://cdn.pixabay.com/photo/2014/09/05/18/32/old-books-436498_960_720.jpg',
        title: 'Old Books',
      ),
      HomeCarouselModel(
        imgSrc:
            'https://cdn.pixabay.com/photo/2015/12/19/20/32/paper-1100254_960_720.jpg',
        title: 'Paper Heart Symbol',
      ),
      HomeCarouselModel(
        imgSrc:
            'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010__340.jpg',
        title:
            'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
      ),
      HomeCarouselModel(
        imgSrc:
            'https://cdn.pixabay.com/photo/2018/01/17/07/06/laptop-3087585__340.jpg',
        title: 'Lorem ipsum, or lipsum as it is sometimes known',
      ),
    ];
  }
}
