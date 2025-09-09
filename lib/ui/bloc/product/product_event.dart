abstract class ProductEvent{}

class GetProductsEvent extends ProductEvent{
  int? catId;
  GetProductsEvent({this.catId});
}
