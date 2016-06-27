name := "todo-app"

version := "0.1"

organization := "ThePrudents"

scalaVersion := "2.11.8"

packageArchetype.java_application

libraryDependencies ++= Seq(
  "com.typesafe.akka" % "akka-http-core_2.11" % "2.4.2",
  "com.typesafe.akka" % "akka-http-spray-json-experimental_2.11" % "2.4.2",
  "ch.qos.logback" % "logback-classic" % "1.1.2",
  "org.slf4j" % "slf4j-api" % "1.7.7",
  "com.typesafe.akka" %% "akka-slf4j" % "2.4.2",
  "com.typesafe.akka" % "akka-http-testkit_2.11" % "2.4.2" % "test",
  "org.scalatest" % "scalatest_2.11" % "2.2.4" % "test"
)

Revolver.settings
