sealed class CategoriesAction {}

class GetCategoriesAction extends CategoriesAction {}
class ChangeCategoryAction extends CategoriesAction{
  int index;
  ChangeCategoryAction(this.index);
}
class ResetCategoriesAction extends CategoriesAction {}