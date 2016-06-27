import com.typesafe.config.ConfigFactory

object Config {
  private val config = ConfigFactory.load()

  object server {
    lazy val port = config.getInt("server.port")
  }

}
