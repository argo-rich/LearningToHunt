-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: learning_to_hunt
-- ------------------------------------------------------
-- Server version	9.0.1

use learning_to_hunt;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20250123172819_CreateIdentitySchema','8.0.12');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `subtitle` varchar(35) DEFAULT NULL,
  `content` text NOT NULL,
  `author_id` int NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Learning How to Hunt','A Step-by-Step Guide','You want to learn to hunt?&#160; Awesome!&#160; Up front I will say there is a lot to it.&#160; Hunting laws, licenses, tags, seasons, gear, tactics and a myriad of options for everything can make learning it all seem overwhelming.&#160; Don\'t worry.&#160; This guide is designed to help you learn what you need upfront without inundating you.&#160; Just go through the sections below in order.&#160; The anchor links are there to help you reference back or skip ahead to a topic you are dying to learn.<div><br></div><div>Let\'s go...<br><div><br></div>&#10;&#10;<div class=\"anchor-links\">&#10;</div>&#10;&#10;<h2 class=\"anchor-point\">Hunter Education</h2><div>This is first stop for most folks.&#160; Many or most states require hunter education/safety training in order to hunt.&#160; Some states waive the requirement if you are old enough.&#160; Either way, I still highly recommend attending hunter ed.&#160; You will learn the basics of your state\'s hunting laws, safety, the seasons in your state and many other hunting topics you don\'t know you need to know.&#160; You can&#160;<a href=\"https://www.ihea-usa.org/find-a-course/\" target=\"_blank\">click here to find out about your states hunter ed requirements</a>.</div><div><br></div><div>Many states utilize <a href=\"https://www.hunter-ed.com/\" target=\"_blank\">hunter-ed.com</a>&#160;for at least part of the training.&#160; The nice thing about using this route (whether your state accepts it or not) is a hunter-ed.com certificate is valid for your lifetime and can often be used if you decide to hunt in another state.</div><div><br></div><div>If you attend an in-person hunter education class, you can ask a lot of questions including the best places nearby to find gear, to hunt, etc.</div><div><br></div>&#10;&#10;<h2 class=\"anchor-point\">Hunting Laws, Seasons and Tags</h2><div>You will learn the basics of all of this in hunter ed.&#160; (Yes, that was another shameless plug for taking the class.)&#160; To find your state\'s hunting laws, click the&#160;<a href=\"https://www.ihea-usa.org/find-a-course/\" target=\"_blank\">same link you used to find your state\'s hunter ed requirements</a>.&#160; Then, on your state\'s hunter ed page, look at the left and/or top navigation.&#160; You should see a link there for your states hunting laws.&#160; If not, google for them.&#160; They are usually updated yearly, so check back before each season starts and review the sections for the species you will be hunting.</div><div><br></div><div><span>Every state is a bit different, but generally you will need a hunting license before you are allowed to hunt.&#160; Some species like deer and turkey require the additional purchase of tags.&#160; Other species such as waterfowl require the purchase of stamps.&#160; Most species can only be hunted in their respective seasons.&#160; There could be some species in your state like wild hogs or coyotes that are considered a nuisance and can be hunted year round.&#160; Check your states hunting laws.</span></div><div><br></div>&#10;&#10;<h2 class=\"anchor-point\">Guns and Gear</h2><div><b><i>The Basics</i></b></div><div>You will learn the basics of what you need in Hunter Ed.&#160; (If you just ain\'t goin\' then google.)&#160; Take notes and after class use them to make a list strictly of bare necessities with no nice-to-haves.&#160; This might not sound fun, but here\'s here\'s the method to the madness:&#160; By sticking with the bare bones need-to-haves, there will be less you need to be overwhelmed with on your first hunt(s).&#160; When you do go hunting, you\'ll discover what works, what doesn\'t and what nice-to-have gadgets might make hunting easier next time.&#160; Also, by sticking to need-to-haves at first, you won\'t end up with a closet full of expensive gear you just discovered doesn\'t work for you.&#160; (Don\'t ask me how I know.)&#160; It could just save your marriage.</div><div><br></div><div>For me, need-to-haves include your hunting license, any necessary tags or stamps, a weapon legal for the species and season, arrows or ammunition, a knife for field dressing and clothing proper for the temperatures encountered.&#160; If you are going to be hunting in a large area or a place you are not very familiar with, then a compass and a map (or&#160;<a href=\"https://www.onxmaps.com/\" target=\"_blank\">OnX Hunt</a>&#160;on your phone) become mandatory.&#160; There are also bright-orange&#160;<a href=\"https://www.google.com/search?q=trail+markers+for+hiking&amp;oq=trail+markers&amp;gs_lcrp=EgZjaHJvbWUqDAgBEAAYFBiHAhiABDIJCAAQRRg5GIAEMgwIARAAGBQYhwIYgAQyBwgCEAAYgAQyBwgDEAAYgAQyBwgEEAAYgAQyBwgFEAAYgAQyBwgGEAAYgAQyBggHEEUYPNIBCDYxMzlqMGo3qAIAsAIA&amp;sourceid=chrome&amp;ie=UTF-8\" target=\"_blank\">trail markers</a>&#160;you can tie on low branches every so many yards to find your way back.&#160; That might not be mandatory for everyone, but safety is a necessity.</div><div><br></div><div>Nice-to-haves include binoculars, rangefinders, camouflage clothing, ground blinds, tree stands, a mono/bi/tripod gun rest and the rest of the gadgets the industry is eager to sell you.&#160; Don\'t get me wrong -- these things make hunting easier and can lead to more successful hunts.&#160; After listing your necessities, if you have budget left over I would next prioritize a rangefinder, binoculars and camo clothing that is quiet and with no visible sheen.</div><div><br></div><div><i><b>Priorities</b></i></div><div>At the very top of your list, prioritize obtaining the proper weapon.&#160; You\'ll need time before the season starts to research, obtain, sight in and practice with your gun or bow.&#160; I also recommend target practicing with the actual gear, straps, slings, holsters, etc. you will be wearing and toting (if your range allows).&#160; Shooting your weapon in the field while wearing all your gear when it\'s below freezing is just different than shooting it in 70 degree weather at the range in a t-shirt.&#160; And due to field conditions (cold, windy, hilly terrain, adrenaline) your accuracy while hunting will be less than what you get at the range, so know your practical distance limit.</div><div><br></div><div><div>You also do not need to have the newest or priciest gear to be successful in the woods.&#160; You can always find used guns and gear at local gun shops, pawn shops and local sporting goods stores.&#160; Military surplus shops are a great source of cheap camo, base layers and much more.&#160; Shop around.</div><div><br></div></div><div><b><i>Bow Hunting</i></b></div><div>If you would like to get into bow hunting, I do recommend&#160;<a href=\"https://www.themeateater.com/gear/gear-hunt/archery-101-finding-a-pro-shop\" target=\"_blank\">finding a local archery pro shop</a>.&#160; These are either dedicated archery places or locally-owned sporting goods stores with an archery section managed by experienced bow hunters.&#160; They will measure your arms and have you pull different bows in order to determine your draw length and draw weight.&#160; Unlike guns which are one-size-fits-all (or one-size-fits-some/most), you <strike>want</strike> need a bow that is configured for your physique.&#160; Once you are ready to buy, the shop will setup your bow for your draw length and weight.&#160; Bows are also typically more expensive than guns.&#160; If you are on a tight budget and want a used bow, I still recommend archery pro shops.&#160; They often have folks who sell or trade their bows in for something fancier.&#160; If you want to throw money away, buy a bow at a garage sale or on clearance at a big box store.</div><div><br></div>&#10;&#10;<h2 class=\"anchor-point\">Where and How to Hunt</h2><div><i>Where</i> and <i>how</i> of hunting are technically two different topics, but they intersect a lot.&#160; And, these two topics will require the most leg work from you (pun intended).&#160; You want to find places conducive to the species you are hunting, when you are hunting them.&#160; For example, the places deer frequent in the middle of the summer are often vastly different than where they go in the winter.&#160; Migratory birds such as ducks and geese... well... migrate throughout the year.&#160; Find places that sustain the species you are hunting at the time of year you are hunting them.&#160;&#160;</div><div><br></div><div><i><b>Hunting Lands</b></i></div><div>There are lots of places to hunt in pretty much all 50 states, but they can be divvied up into 2 general categories: <i>public</i> land and <i>private</i> land.&#160; Public hunting lands are local, county, state or federal lands open to public hunting.&#160; Private hunting land is hunting land not owned by the gummyment.&#160;&#160;</div><div><br></div><div><i>Public Land</i></div><div>There are thousands of public lands across the country and they are pretty easy to find.&#160; Go back again to&#160;<a href=\"https://www.ihea-usa.org/find-a-course/\" target=\"_blank\">find your state\'s hunter ed requirements link</a>&#160;and on your state\'s hunter ed page look for a link that says something like, &#34;Places to Hunt&#34;, &#34;Game Management Units&#34;, &#34;Wildlife Management Areas&#34; or&#160;<span>&#34;Public Hunting Atlas&#34;</span><span>.&#160; If that comes up dry, try googling for &#34;&lt;insert-your-state&gt; public hunting land&#34;.&#160; Some states provide a really nice map and others a database you can search or sort by county.&#160; You can&#160;</span><a href=\"https://www.fws.gov/hunting/map\" target=\"_blank\">find federal hunting land here</a><span>.&#160;&#160;</span></div><div><span><br></span></div><div><span>Another way to find public land is with the&#160;</span><a href=\"https://www.onxmaps.com/hunt/app\" target=\"_blank\">onX Hunt app</a><span>.&#160; I will discuss the app more below, but for the public lands discussion,&#160;</span><span>their app has a feature that will show where public hunting lands are (</span><span>turn on Public Land and GMU Map Layers).</span></div><div><span><br></span></div><div><span><i>Private Land</i></span></div><div><span>Private hunting lands are hunting areas owned by private individuals (or companies).&#160; Often they are farmers, or just folks who own a lot of land.&#160; Most folks find someone they know or a friend of a friend of a friend with land and ask to hunt there.&#160; Other folks lease land to hunt.&#160; The way that works is you pay a fee and are allowed usually exclusive rights to hunt the property for a set period of time.&#160; There are lots of&#160;</span><a href=\"https://www.google.com/search?q=lease+hunting+land&amp;oq=lease+hu&amp;gs_lcrp=EgZjaHJvbWUqDAgAEAAYFBiHAhiABDIMCAAQABgUGIcCGIAEMgcIARAAGIAEMgwIAhAAGBQYhwIYgAQyBggDEEUYOTIHCAQQABiABDIGCAUQRRg9MgYIBhBFGDwyBggHEEUYPNIBCDI5NDlqMGo3qAIAsAIA&amp;sourceid=chrome&amp;ie=UTF-8\" target=\"_blank\">websites which show available lands to lease</a><span>.&#160;&#160;</span></div><div><span><br></span></div><div><span><i><b>Tactics and Strategies</b></i></span></div><div><span><i>Hunting Apps</i></span></div><div><a href=\"https://www.onxmaps.com/hunt/app\" target=\"_blank\">OnX Hunt</a><span>&#160;is the standard hunting app all others are compared to.&#160; It is basically Google Earth plus for hunters.&#160; By default i</span><span>t shows property boundaries, the name of the property owner and a GPS pin showing where you are located.&#160; This helps keep you on the property you have permission to hunt and shows you where you are on a map if you are ever lost.&#160; Also, the app can show the topography,&#160;</span><span>current wind direction and allow you set waypoints/pins on the map while you are scouting or hunting.&#160; For example if you see something like 5 deer trails converging on the same spot, you can set a waypoint on the map with a description so you can find the spot later when planning or hunting.&#160; There are many other features like&#160;</span><span>turning on the public land and GMU map layers to find public hunting grounds.&#160; There is also a web version you can use from your home computer to view the maps on a larger screen while planning your hunt.</span></div><div><span><br></span></div><div><span>I have no affiliation with onX other than being a happy customer.&#160; But&#160;</span><span>I and lots of other hunters have found this app to be indispensable.&#160; It</span><span>&#160;costs $35 a year for one state.&#160; The best competitor to onX Hunt is&#160;</span><a href=\"https://www.huntstand.com/\" target=\"_blank\">Huntstand</a>.&#160; I have never used it, but Outdoor Life ranked it slightly higher than onX in a&#160;<a href=\"https://www.outdoorlife.com/tested-best-hunting-apps-for-hunters/\" target=\"_blank\">5 year old hunting app comparison</a>.&#160; There are other apps such as&#160;<a href=\"https://huntwise.com/\" target=\"_blank\">HuntWise</a>,&#160;<a href=\"https://www.trophytracks.com/\" target=\"_blank\">TrophyTracks</a>,&#160;<a href=\"https://www.youtube.com/c/Powderhook\" target=\"_blank\">Powderhook</a>&#160;and good old&#160;<a href=\"https://earth.google.com/\" target=\"_blank\">Google Earth</a>.&#160; Most of these are compliments rather than replacements for onX Hunt or Huntstand.</div><div><br></div><div><i>Scouting</i></div><div>Once you find places to hunt, you need to scout the areas out to discover the best spots to hunt.&#160; For example, look for deer sign like rubs, feces, trails, etc.&#160; Figure out where they bed and where their food and water is.&#160; One really good book on this topic is Brad Herndon\'s&#160;<a href=\"https://www.amazon.com/Mapping-Trophy-Bucks-Brad-Herndon/dp/0873495039\" target=\"_blank\">Mapping Trophy Bucks</a>.&#160; This book will show you what terrain features deer like and how to find them using a map.&#160; From there, go scout an area out and if you are able, prep the area.</div><div><br></div><div><i>Prepping a Hunting Location</i></div><div>If you are legally able to, prep your hunting spots.&#160; This would include trimming branches around a hunting stand or ground blind location to create unobstructed shooting lanes.&#160; Bullets and arrows can go off course if they hit a twig on their flight to the animal.&#160; This can cause you to miss entirely or worse, wound the animal.&#160; Another prep tactic is to remove all sticks, leaves and debris from the path you will take to your spot.&#160; This allows you to walk in silently.</div><div><br></div><div><i>Fooling Your Prey</i></div><div>For species like deer and turkey, the name of the game is to not be detected.&#160; For turkey, camouflage is important.&#160; For deer, you want to stay downwind.&#160; For both species a good rule of thumb is, &#34;shut up and don\'t move&#34;.&#160; If they don\'t know you\'re there, you have a chance.&#160; Once they detect you, it\'s pretty much over for awhile.</div><div><br></div>&#10;&#10;<h2 class=\"anchor-point\">I Got One!... Now What?</h2><div>So you followed the steps, hunted, shot and&#160;<span>recovered your deer, turkey, duck, pheasant, etc.</span><span>&#160; Congratulations!&#160; All your hard work has finally paid off.&#160; So... now what?&#160; Well, field dressing is the first thing.&#160; After that process the animal and then it\'s mealtime.</span></div><div><br></div><div><i><b>Field Dressing</b></i></div><div>This is also known as &#34;gutting&#34; an animal and means removing the internal organs and leaving them in the field for racoons, opossum and/or coyotes to feast on.&#160; Can you do this after you get home?&#160; If you don\'t care how the meat tastes, yes.&#160; By removing the internal organs within 30 minutes of death, you allow the meat to cool down faster and prevent bacteria from migrating from the guts and into the meat (which ruins the flavor).&#160; Field dressing deer also removes 1/3 of their weight, which makes them easier to drag back to the truck.&#160; There are a myriad of YouTube videos on how to gut the various species.&#160; Just google, &#34;how to field dress &lt;xyz-species&gt;&#34;.</div><div><br></div><div><i><b>Processing Game</b></i><i></i></div><div>This is another google endeavor and opportunity to become &#34;YouTube certified&#34;.&#160; There are a plethora of videos out there on the topic<span>, but obviously the larger the animal, the longer it will take to process.&#160;&#160;</span>For larger game like deer, some hunters opt to pay a locker to process the meat.&#160; That has become pretty expensive<span>&#160;so many opt to do it themselves.&#160; If you choose to process a deer yourself, you need to&#160;</span><a href=\"https://www.youtube.com/watch?v=rcFJOcppQa4\" target=\"_blank\">skin it</a><span>&#160;before </span><a href=\"https://www.youtube.com/watch?v=-r2ctQJJMsc\" target=\"_blank\">butchering</a><span>.&#160;&#160;</span></div><div><i><br></i></div><div><i><b>Cooking Game</b></i></div><div>There are also a myriad of recipes for the myriad of game out there.&#160; I will share a couple of tidbits related to deer.&#160; First, deer have all the same cuts as beef -- the same cuts in the same places on the animal.&#160; That said, you can put all the cuts into two categories:&#160; 1) Tender cuts: the steaks, tenderloins and backstraps.&#160; These should be cooked on high heat for short periods of time, just like steak.&#160; 2) The second category are the tougher cuts: the roasts, trim and pieces.&#160; These parts need to be cooked at low temperatures for longer periods of time, just like a beef roast.&#160; The trim pieces can be added to a chili or stew and cooked a few hours in a crock pot.&#160; Or if you have a grinder you can make them into ground venison.</div><div><br></div><div>The second tidbit is the most delicious venison recipe I have ever tasted.&#160; When I made it after hunting my first deer, my family asked when I was going hunting again.&#160; In fact my wife is vegan, but will deviate from that for this recipe.&#160; Without further ado, it is Venison Steak Diane.&#160; I originally found it on The Spruce Eats website, but unfortunately the original recipe is no longer there.&#160; However, if you follow this&#160;<a href=\"https://www.thespruceeats.com/classic-steak-diane-recipe-7503150\" target=\"_blank\">steak diane recipe</a>&#160;and substitute the steaks with venison steaks or medallioned venison tenderloins, the recipe works the same.&#160; This is a great way to expose your family to deer meat.</div><div><br></div></div>',1,'2025-01-15 10:41:10','2025-01-15 10:41:10');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('d5946d47-33b3-47b7-bf0e-979adf84461e','Admin','ADMIN',NULL),('ef07f010-1553-46d2-a199-c0077829eb1a','User','USER',NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('a92403d4-f0bd-4fec-8d11-7b4408692a69','d5946d47-33b3-47b7-bf0e-979adf84461e'),('a92403d4-f0bd-4fec-8d11-7b4408692a69','ef07f010-1553-46d2-a199-c0077829eb1a'),('c9344317-0241-4001-8650-73b83b0be6bb','ef07f010-1553-46d2-a199-c0077829eb1a');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('a92403d4-f0bd-4fec-8d11-7b4408692a69','Rich','Argo','rich@argohaus.com','RICH@ARGOHAUS.COM','rich@argohaus.com','RICH@ARGOHAUS.COM',0,'AQAAAAIAAYagAAAAEMvU04CfO8nkeJiJB6C57MS5B0JSSQO76gT9/VofBeJ0EbbSQ5HEc3sXzIuhenORsg==','7OHCBTERF7QSFK237RYIWGIYHZOXROXI','ca3d53a0-dc4c-4afd-b96e-be4481766a03',NULL,0,0,NULL,1,0),('c9344317-0241-4001-8650-73b83b0be6bb','Test','Tester','test@test.com','TEST@TEST.COM','test@test.com','TEST@TEST.COM',0,'AQAAAAIAAYagAAAAEIV+MCTAdV9dj1CDNZvGRpaY33cvZSnXk9CcE3FmQZyf2kmb3uOOD8iNeBFvjZswIw==','JRWL67E4XRF6GQJKD5FP7AYPHBMBKHF6','1cef9ea7-8d8d-458a-b439-ccba9eac8ddd',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `company` varchar(45) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Rich Argo','Learning to Hunt','2025-01-15 10:41:10','2025-01-15 10:41:10');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `subtitle` varchar(35) DEFAULT NULL,
  `content` text NOT NULL,
  `author_id` int NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`blog_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'First Blog Title','First Blog Subtitle','This is the blog content',1,'2025-01-15 10:41:10','2025-01-15 10:41:10');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-31 14:47:19
