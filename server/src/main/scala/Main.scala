import akka.actor._
import akka.http.scaladsl.Http
import akka.stream._
import todo.{TodoRoutes, TodoStorage}

object Main extends App with TodoStorage with TodoRoutes {
  implicit val system = ActorSystem()
  implicit val executor = system.dispatcher
  implicit val materializer = ActorMaterializer()

  Http(system).bindAndHandle(routes, "0.0.0.0", port = Config.server.port)
    .foreach(binding => system.log.info("Bound to " + binding.localAddress))
}
