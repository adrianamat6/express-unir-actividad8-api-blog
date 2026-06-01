-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: unir_blog
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
CREATE DATABASE IF NOT EXISTS unir_blog;
USE unir_blog;


DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Juan Pérez','juan.perez@email.com','https://randomuser.me/api/portraits/men/32.jpg'),(2,'Ana Gómez','ana.gomez@email.com','https://randomuser.me/api/portraits/women/44.jpg'),(3,'Laura García','laura.garcia@unir.edu','https://randomuser.me/api/portraits/women/15.jpg'),(4,'Carlos Ruiz','carlos.ruiz@unir.edu','https://randomuser.me/api/portraits/men/46.jpg'),(5,'Sofía Martínez','sofia.martinez@unir.edu','https://randomuser.me/api/portraits/women/8.jpg'),(6,'Miguel Fernández','miguel.fernandez@unir.edu','https://randomuser.me/api/portraits/men/66.jpg'),(7,'Elena Gómez','elena.gomez@unir.edu','https://randomuser.me/api/portraits/women/33.jpg'),(8,'David López','david.lopez@unir.edu','https://randomuser.me/api/portraits/men/11.jpg'),(9,'Carmen Sánchez','carmen.sanchez@unir.edu','https://randomuser.me/api/portraits/women/22.jpg'),(10,'Javier Torres','javier.torres@unir.edu','https://randomuser.me/api/portraits/men/22.jpg'),(11,'Ana Navarro','ana.navarro@unir.edu','https://randomuser.me/api/portraits/women/68.jpg'),(12,'Diego Castro','diego.castro@unir.edu','https://randomuser.me/api/portraits/men/55.jpg'),(13,'Jane Doe','jane.doe@example.com','https://randomuser.me/api/portraits/women/1.jpg'),(15,'Jampier Cabrera','jampier.cabrera@example.com','https://randomuser.me/api/portraits/women/2.jpg'),(17,'Jampiera Cabrera','jampiera.cabrera@example.com','https://randomuser.me/api/portraits/women/3.jpg');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `categoria` varchar(100) NOT NULL,
  `autor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Introducción a Express','Conceptos básicos para crear una API con ExpressJS...','2026-05-31 13:06:09','Backend',1),(2,'Bases de datos relacionales','Cómo usar MySQL en proyectos Node.js...','2026-05-31 13:06:09','Bases de Datos',1),(3,'Guía de SQL','Aprende a hacer JOINs correctamente...','2026-05-31 13:06:09','Bases de Datos',2),(4,'Introducción a Node.js','En este artículo exploraremos los fundamentos de Node.js, su event loop y por qué es tan rápido para operaciones I/O.','2026-05-31 13:07:24','Backend',1),(5,'ExpressJS desde cero','Aprende a montar tu primera API RESTful utilizando ExpressJS, definiendo rutas y middlewares básicos.','2026-05-31 13:07:24','Backend',1),(6,'Seguridad en APIs','Consejos esenciales para proteger tus endpoints, incluyendo el uso de JWT, Helmet y control de CORS.','2026-05-31 13:07:24','Backend',1),(7,'Domina React en 2024','Guía completa sobre las nuevas características de React, incluyendo los Server Components y los nuevos hooks.','2026-05-31 13:07:24','Frontend',2),(8,'CSS Grid vs Flexbox','Una comparativa práctica para saber cuándo utilizar CSS Grid y cuándo optar por Flexbox en tus layouts.','2026-05-31 13:07:24','Frontend',2),(9,'Optimización de consultas SQL','Descubre cómo los índices pueden salvar tu base de datos relacional cuando las tablas crecen masivamente.','2026-05-31 13:07:24','Bases de Datos',3),(10,'Normalización de Bases de Datos','Aprende las 3 primeras formas normales para diseñar esquemas de bases de datos relacionales eficientes.','2026-05-31 13:07:24','Bases de Datos',3),(11,'MySQL vs PostgreSQL','Analizamos las diferencias clave, ventajas y desventajas de los dos motores relacionales más populares del mercado.','2026-05-31 13:07:24','Bases de Datos',3),(12,'NoSQL: ¿Cuándo usar MongoDB?','No todo es SQL. Analizamos casos de uso reales donde una base de datos orientada a documentos es la mejor opción.','2026-05-31 13:07:24','Bases de Datos',3),(13,'Docker para desarrolladores','Deja de decir \"en mi máquina funciona\". Aprende a contenerizar tus aplicaciones Node con Docker.','2026-05-31 13:07:24','DevOps',4),(14,'CI/CD con GitHub Actions','Automatiza tus pruebas y despliegues creando flujos de trabajo eficientes directamente desde tu repositorio.','2026-05-31 13:07:24','DevOps',4),(15,'Accesibilidad Web (a11y)','Hacer webs bonitas no es suficiente; aprende a hacerlas accesibles para todos los usuarios.','2026-05-31 13:07:24','Frontend',5),(16,'Animaciones con CSS','Dale vida a tus proyectos web con transiciones y animaciones CSS sin sobrecargar el rendimiento con JavaScript.','2026-05-31 13:07:24','Frontend',5),(17,'Arquitectura de Microservicios','Conceptos básicos para dividir un monolito en microservicios independientes y escalables.','2026-05-31 13:07:24','Arquitectura',6),(18,'El patrón MVC','Repaso al patrón Modelo-Vista-Controlador y cómo implementarlo de forma efectiva en Express.','2026-05-31 13:07:24','Arquitectura',6),(19,'Testing con Jest','Cómo configurar Jest en tu proyecto y escribir tests unitarios efectivos para tu código de backend.','2026-05-31 13:07:24','Testing',7),(20,'TDD: Test Driven Development','Desarrollo guiado por pruebas: escribe primero el test, luego el código. Descubre sus beneficios.','2026-05-31 13:07:24','Testing',7),(21,'Pruebas de integración con Supertest','Aprende a probar tus rutas de Express de principio a fin utilizando la librería Supertest.','2026-05-31 13:07:24','Testing',7),(22,'Guía de Git avanzada','Ve más allá de commit y push. Domina rebase, cherry-pick y resolución de conflictos complejos.','2026-05-31 13:07:24','Herramientas',8),(23,'Configurar ESLint y Prettier','Mantén un código limpio y estandarizado en tu equipo gracias a estas herramientas de formateo y linting.','2026-05-31 13:07:24','Herramientas',8),(24,'WebSockets con Socket.io','Cómo crear aplicaciones en tiempo real, como chats o notificaciones push, integrando Socket.io en Express.','2026-05-31 13:07:24','Backend',9),(25,'Manejo de errores en Express','Crea un middleware global para capturar y gestionar errores de forma estructurada en tu API.','2026-05-31 13:07:24','Backend',9),(26,'Subida de archivos con Multer','Guía paso a paso para gestionar la carga de imágenes y archivos en tu servidor Node.js.','2026-05-31 13:07:24','Backend',9),(27,'Cómo preparar una entrevista técnica','Consejos, preguntas frecuentes y actitudes que te ayudarán a conseguir tu primer trabajo como Junior.','2026-05-31 13:07:24','Carrera',10),(28,'El síndrome del impostor','Todos lo sufrimos. Estrategias psicológicas y profesionales para lidiar con él en el mundo tech.','2026-05-31 13:07:24','Carrera',10),(29,'Introducción a TypeScript','Por qué el tipado estático te salvará de muchos dolores de cabeza en proyectos grandes de JavaScript.','2026-05-31 13:11:36','Frontend',1),(30,'Patrones de Diseño en Node.js','Cómo aplicar Singleton, Factory y Observer en tus aplicaciones backend para un código más limpio.','2026-05-31 13:11:36','Arquitectura',1),(31,'Diseño UI/UX para Programadores','Conceptos básicos de diseño que todo desarrollador Frontend debería conocer para mejorar sus interfaces.','2026-05-31 13:11:36','Frontend',2),(32,'Fundamentos de Figma','Guía rápida para desarrolladores: cómo extraer assets, colores y medidas de un diseño en Figma.','2026-05-31 13:11:36','Herramientas',2),(33,'Módulo Cluster en Node.js','Aprende a aprovechar todos los núcleos de tu CPU creando múltiples hilos en tu servidor Node.','2026-05-31 13:11:36','Backend',3),(34,'Vue.js vs React en 2024','Un análisis objetivo de ambas librerías, sus ecosistemas y por qué deberías probar la Composition API.','2026-05-31 13:11:36','Frontend',4),(35,'Redis como sistema de Caché','Acelera las respuestas de tu API en Express implementando Redis para guardar consultas frecuentes.','2026-05-31 13:11:36','Bases de Datos',5),(36,'Transacciones ACID en MySQL','Garantiza la integridad de tus datos aprendiendo a usar COMMIT y ROLLBACK correctamente.','2026-05-31 13:11:36','Bases de Datos',5),(37,'Primeros pasos con Kubernetes','Entiende qué es un Pod, un Node y cómo orquestar tus contenedores en producción.','2026-05-31 13:11:36','DevOps',6),(38,'Tailwind CSS: Pros y Contras','Analizamos por qué el enfoque utility-first está dominando el mercado y cuándo evitarlo.','2026-05-31 13:11:36','Frontend',7),(39,'Modo Oscuro con CSS Variables','Implementa un dark mode nativo y eficiente usando variables CSS y localStorage.','2026-05-31 13:11:36','Frontend',7),(40,'GraphQL vs REST API','Descubre las diferencias fundamentales y por qué GraphQL evita el problema del over-fetching.','2026-05-31 13:11:36','Arquitectura',8),(41,'Serverless Architecture','Introducción a AWS Lambda y cómo desplegar funciones en la nube sin gestionar servidores.','2026-05-31 13:11:36','Arquitectura',8),(42,'Testing E2E con Cypress','Automatiza las pruebas de tu interfaz gráfica simulando el comportamiento de un usuario real.','2026-05-31 13:11:36','Testing',9),(43,'Vite: El fin de Webpack','Descubre por qué Vite es increíblemente rápido y cómo migrar tus proyectos antiguos.','2026-05-31 13:11:36','Herramientas',10),(44,'Control de versiones con Git Flow','Un estándar de ramas indispensable para trabajar de forma ordenada en equipos grandes.','2026-05-31 13:11:36','Herramientas',10),(45,'Implementar Webhooks en Express','Cómo recibir notificaciones en tiempo real desde servicios externos como Stripe o GitHub.','2026-05-31 13:11:36','Backend',11),(46,'Autenticación con OAuth 2.0','Guía para permitir a tus usuarios iniciar sesión con su cuenta de Google o GitHub (Passport.js).','2026-05-31 13:11:36','Backend',11),(47,'El Portafolio del Full Stack','Qué proyectos debes incluir sí o sí en tu GitHub para destacar en las entrevistas de trabajo.','2026-05-31 13:11:36','Carrera',12),(48,'Trabajo en remoto','Las mejores prácticas, herramientas de comunicación y cómo mantener la productividad desde casa.','2026-05-31 13:11:36','Carrera',12),(49,'Mi primer post en el Blog','Esta es la descripción detallada del post de prueba.','2026-05-31 19:11:09','Tecnología',1),(50,'Mi primer post en el Blog','Esta es la descripción detallada del post de prueba.','2026-06-01 11:25:50','Tecnología',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-01 11:47:05
