class GithubInformation {
  String name;
  String repoUrl;
  String description;

  GithubInformation({this.description, this.name, this.repoUrl});

  GithubInformation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    repoUrl = json['html_url'];
    description = json['description'];
  }
}
