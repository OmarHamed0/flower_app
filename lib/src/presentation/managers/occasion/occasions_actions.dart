sealed class OccasionActions{}
class GetOccasionsAction extends OccasionActions{}
class ChangeOccasionAction extends OccasionActions{
  final int index;
  ChangeOccasionAction({required this.index});
}