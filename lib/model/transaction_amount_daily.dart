
class TransactionAmountDaily {

  final int dayNumber;
  final String dayName;
  final double amount;
  final double totalOfPeriod;

  double _percentAmountOfTotal;

  TransactionAmountDaily({
    this.dayNumber = 1,
    this.dayName = "Monday",
    this.amount = 0,
    this.totalOfPeriod = 0,
  }){
    _processPercentAmountOfTotal();
  }

  void _processPercentAmountOfTotal(){
    if(amount == 0 || totalOfPeriod == 0) {
      _percentAmountOfTotal = 0;
      return;
    }
    _percentAmountOfTotal = (amount / totalOfPeriod) * 100;
  }

  double get percentAmountOfTotal => _percentAmountOfTotal;
}