package todo

case class TodoUpdate(title: Option[String], completed: Option[Boolean], order: Option[Int])
