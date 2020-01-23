
class TransactionAmountDaily {

  final int dayNumber;
  final String dayName;
  final double amount;
  final double totalOfWeek;

  double _percentAmountOfTotal;

  TransactionAmountDaily({
    this.dayNumber = 1,
    this.dayName = "Monday",
    this.amount = 0,
    this.totalOfWeek = 0,
  }){
    _processPercentAmountOfTotal();
  }

  void _processPercentAmountOfTotal(){
    _percentAmountOfTotal = (amount / totalOfWeek) * 100;
  }

  double get percentAmountOfTotal => _percentAmountOfTotal;
}