package todo

import akka.stream._

trait FlowMaterializerProvider {
  implicit val materializer: Materializer
}
