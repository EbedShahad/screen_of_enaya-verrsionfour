class State {
    State({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    dynamic createdAt;
    dynamic updatedAt;

    factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
