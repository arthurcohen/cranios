class Receipt {
  int id;
  String image;
  String observation;
  int status;

  Receipt(this.id, this.image, this.observation, this.status);
  
  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      json['id'],
      json['image'],
      json['observation'],
      json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'image': this.image,
    'observation': this.observation,
    'status': this.status,
  };
}
