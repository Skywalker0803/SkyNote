class Note {
  const Note({
    required this.name,
    this.content = "",
    required this.createTime,
    this.frontMatter = "",
    this.subjects = "",
    this.background = "",
    this.likes = 0,
  });
  final DateTime createTime;
  final String name;
  final String content;
  final String frontMatter;
  final String subjects;
  final String background;
  final double likes;
}
