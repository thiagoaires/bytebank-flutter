class ContactModel {
  final int id;
  final String name;
  final int accountNumber;

  ContactModel(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() {
    return '${this.id}, ${this.name}, ${this.accountNumber}';
  }
}
