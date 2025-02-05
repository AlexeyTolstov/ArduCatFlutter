int _contactId = 0;

class ContactId {
  final int id = _contactId++;

  ContactId();

  @override
  String toString() => "Contact ID: $id";

  @override
  bool operator ==(Object other)
    => other is ContactId && id == other.id;

  @override
  int get hashCode => id.hashCode;
}