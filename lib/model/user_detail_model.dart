class userdetailmodel {
  final String name;
  final String address;

  userdetailmodel(this.name, this.address);

  Map<String, dynamic> getjson() => {
        "name": this.name,
        "address": this.address,
      };
}
