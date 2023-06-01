-- MySQL dump 10.13  Distrib 5.7.34, for osx10.12 (x86_64)
--
-- Host: localhost    Database: item_management
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '登録したユーザーのID',
  `cd` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品番号',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '種類 1トップス 2ボトムス 3アウター 4インナー 5アクセサリー6其の他',
  `sz` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'サイズ',
  `cs` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '色名',
  `itp` int(11) NOT NULL COMMENT '販売価格',
  `itc` int(11) NOT NULL COMMENT '原価',
  `itbn` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ブランド名',
  `detail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品説明',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_user_id_index` (`user_id`),
  KEY `items_cd_index` (`cd`),
  KEY `items_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'1111-1111','H by FIGER ストレッチチノパンツ','active','アウター','100','オフホワイト',6500,3000,'H by FIGER','生地全体にストレッチ性があり、ウエストのベルト部分も若干の伸び感があります。\r\n伸び感のある穿き心地なので長時間穿いてもラクラク！！ちょっと食ベ過ぎたかな～って時にもお腹にジャストフィット！\r\nさらに、股裏には股ズレ軽減シックも備えて隠れた所も技ありなパンツです。','2023-05-28 01:24:02','2023-05-28 01:45:40'),(2,1,'1111-1112','H by FIGER 切替長袖ラガーシャツ','active','トップス','L','黒',3500,1200,'H by FIGER','H by FIGERの切替長袖ラガーシャツです。\r\nメリハリのあるバイカラーの切替がgoodなアイテム。\r\nH by FIGERの切替長袖ラガーシャツです。\r\nメリハリのあるバイカラーの切替がgoodなアイテム','2023-05-28 01:25:13','2023-05-28 01:46:47'),(3,1,'1111-1113','H by FIGER 切替中綿ベスト','active','アウター','LL','ブラック×ブラック',6500,3000,'H by FIGER','H by FIGERの切替中綿ベストです。\r\n\r\n軽めの中綿が入っているので背中ポカポカ保温効果バッチリ！\r\n表地はリップストップの丈夫な生地。\r\n袖のないベストはスッキリとしたシルエットだから着膨れが気になりません。\r\nフラップの付いたサイドポケットは横から手を入れられるデザイン。\r\n裾口はスピンドルで絞りができます。\r\n動きやすい作りでお腹周りもラクちん！','2023-05-28 01:26:30','2023-05-28 01:45:55'),(4,1,'1111-1113','BEN DAVIS 布帛ポケット半袖Tシャツ','active','トップス','F','白色',3900,2300,'BEN DAVIS','BEN DAVISの布帛ポケット半袖Tシャツです。','2023-05-28 01:48:07','2023-05-28 01:48:07'),(5,1,'1111-1115','Mc.S.P チェック長袖B.Dネルシャツ','active','アウター','M','黒',3000,2000,'Mc.S.P','Mc.S.Pのチェック長袖B.Dネルシャツです。\r\n仕様\r\n【素材】\r\n表面が起毛している薄手のネル素材。\r\n\r\n胸ポケット有／袖アジャストボタン／#ボタンダウンカラー／バックセンタータック','2023-05-28 01:50:05','2023-05-28 01:50:05'),(6,1,'1111-1116','in the attic 圧縮キルトフーデットベスト','active','アウター','3L','白色',6900,3000,'in the attic','in the atticのフード付きキルティングベスト。\r\n毎シーズン人気で完売する中綿ベストが、今季はスポーティミックスなデザインになりました。\r\n金属製の壁のような柄に圧縮したテクスチャーは、ジップアップで着ても前を開けてラフにしてもクールな表情。\r\nファスナーを綴ると現れるテープに描かれた英字も男の遊び心をくすぐります。\r\n袖が無いので、Tシャツやトレーナー、プルパーカーの上に着るアウターとしても最適。\r\nバック裾はやや長めでラウンドしたデザインで、オーバーサイズ風な今どきなシルエットを楽しめます。','2023-05-28 01:51:27','2023-05-28 01:51:27'),(7,1,'1111-1117','THRASHER 半袖Tシャツ','active','トップス','L','黒',3900,2900,'THRASHER','THRASHERの半袖Tシャツです。','2023-05-28 01:52:47','2023-05-28 01:52:47'),(8,1,'1111-1118','Fanatics PEPPER MILL半袖Tシャツ','active','トップス','2L','黒',3900,2300,'Fanatics PEPPER MILL','WBC優勝記念Tシャツ！大谷選手＆ヌートバー選手のペッパーミル！\r\n企画から発売まで3日間で商品化し、発売から2週間で3万枚を突破した大谷選手とヌートバー選手のペッパーミルTシャツ。','2023-05-28 01:55:10','2023-05-28 01:55:10'),(9,1,'1111-1119','RALPH LAUREN 半袖Tシャツ','active','トップス','M','黒',5900,3000,'RALPH LAUREN','RALPH LAURENの半袖Tシャツです。\r\n\r\nプリントや生地感がユーズドな雰囲気を漂わせるTシャツ。','2023-05-28 01:56:44','2023-05-28 01:56:44'),(10,1,'1111-1120','Coleman USAコットン半袖Tシャツ','active','トップス','2L','ネイビー',4500,2300,'Coleman (コールマン)','ColemanのUSAコットン半袖Tシャツです。\r\n\r\n仕様\r\n【U.S.A COTTON】\r\nより環境に配慮した地球に優しいコットン。\r\nドライな肌触りと、強度の高さが特徴。','2023-05-28 01:58:32','2023-05-28 01:58:32'),(11,1,'1111-1121','THE NORTH FACE ダッフルバッグ','active','その他','F','オレンジ',19800,12000,'THE NORTH FACE','THE NORTH FACEのバックパック『エクスプローラーヒューズボックス』です。\r\n非常に丈夫な作りで耐久性がある、人気のボックス型バックパック。\r\n・クッション素材のパッド入りのショルダーストラップ\r\n・金属製のスナップボタンが付いたハンドルで、持ち運びも便利\r\n・トップの蓋部分になる内ポケットはファスナー付きで小物の整理に便利、中にフックも装備\r\n・フリースの裏地付きPCスリーブは、PCを衝撃や落下から保護','2023-05-28 02:00:15','2023-05-28 02:00:15'),(12,1,'1111-1122','絡繰魂 九尾エンボスレザーウォレット','active','アクセサリー','F','黒',20000,12000,'絡繰魂','9本の尾をもつキツネの霊獣、「九尾」がデザインされた財布。\r\n九尾の狐は瑞獣(ずいじゅう)と呼ばれる、良い事が訪れる前兆に現れる生き物として言い伝えられています。\r\nまた、繁栄をもたらす守り神と言われるほどパワーがある妖怪九尾。\r\n\r\nそんな九尾がエンボス加工で施された財布はインパクト大。\r\nカッコよさを追求した大人の男性にピッタリのお財布です。','2023-05-28 02:01:33','2023-05-28 02:01:33'),(13,1,'1111-1123','PUMA 2Pニットトランクス','active','インナー','F','ネイビー×ブラック',2900,2000,'PUMA','PUMAのニットトランクス2枚組。安心の綿100％素材です。\r\n毎日使うものだから品質にもこだわりたいですね。\r\nネイビーとブラックカラーの2枚セット！','2023-05-28 02:03:11','2023-05-28 02:03:11'),(14,1,'1111-1123','OUTDOOR PRODUCTS 3Pメッシュアンクルソックス','active','インナー','F','黒',2000,800,'OUTDOOR PRODUCTS (アウトドア プロダクツ)','OUTDOOR PRODUCTSのメッシュアンクルソックス3足セットです。','2023-05-28 02:04:53','2023-05-28 02:04:53'),(15,1,'1111-1125','BREEZE/DRY ロングボクサーパンツ','active','インナー','F','黒',3000,1600,'BREEZE/DRY','BREEZE/DRYのロングボクサーパンツです。\r\n汗をかいても瞬間速乾！さらさら感5倍、薄手で軽いメッシュ素材。\r\n肌のベタつきを解消し、サラッとした肌触りを維持して汗冷え軽減。ちょっと長めの膝上丈で股ずれ防止にも。\r\n汗をかいてもサラサラ感が続くように、股間とバック全体には疎水性の高いポリプロピレンを使用しています。','2023-05-28 02:05:55','2023-05-28 02:05:55'),(16,1,'1111-1126','NESTA BRAND 天竺半袖Tシャツ','active','トップス','F','黒',5900,4000,'NESTA BRAND','NESTA BRANDの天竺半袖Tシャツです。','2023-05-28 02:06:59','2023-05-28 02:06:59'),(17,1,'1111-1127','NESTA BRAND ウォッシュドデニムハーフパンツ','active','ボトムス','120','ネイビー',9800,6000,'NESTA BRAND','NESTA BRANDのウォッシュドデニムハーフパンツです。','2023-05-28 02:08:37','2023-05-28 02:08:37'),(18,1,'1111-1111','H by FIGER ストレッチチノパンツ','active','アウター','100','オフホワイト',6500,3000,'H by FIGER','生地全体にストレッチ性があり、ウエストのベルト部分も若干の伸び感があります。\r\n伸び感のある穿き心地なので長時間穿いてもラクラク！！ちょっと食ベ過ぎたかな～って時にもお腹にジャストフィット！\r\nさらに、股裏には股ズレ軽減シックも備えて隠れた所も技ありなパンツです。','2023-05-28 02:10:44','2023-05-28 02:10:44'),(19,1,'1111-1109','H by FIGER 切替長袖ラガーシャツ','active','トップス','L','黒',3500,1200,'H by FIGER','H by FIGERの切替長袖ラガーシャツです。\r\nメリハリのあるバイカラーの切替がgoodなアイテム。\r\nH by FIGERの切替長袖ラガーシャツです。\r\nメリハリのあるバイカラーの切替がgoodなアイテム','2023-05-28 02:10:44','2023-05-28 08:45:26'),(20,1,'1111-1113','H by FIGER 切替中綿ベスト','active','アウター','LL','ブラック×ブラック',6500,3000,'H by FIGER','H by FIGERの切替中綿ベストです。\r\n\r\n軽めの中綿が入っているので背中ポカポカ保温効果バッチリ！\r\n表地はリップストップの丈夫な生地。\r\n袖のないベストはスッキリとしたシルエットだから着膨れが気になりません。\r\nフラップの付いたサイドポケットは横から手を入れられるデザイン。\r\n裾口はスピンドルで絞りができます。\r\n動きやすい作りでお腹周りもラクちん！','2023-05-28 02:10:44','2023-05-28 02:10:44'),(21,1,'1111-1112','BEN DAVIS 布帛ポケット半袖Tシャツ','active','トップス','F','白色',3900,2300,'BEN DAVIS','BEN DAVISの布帛ポケット半袖Tシャツです。','2023-05-28 02:10:44','2023-05-28 08:45:08'),(22,1,'1111-1115','Mc.S.P チェック長袖B.Dネルシャツ','active','アウター','M','黒',3000,2000,'Mc.S.P','Mc.S.Pのチェック長袖B.Dネルシャツです。\r\n仕様\r\n【素材】\r\n表面が起毛している薄手のネル素材。\r\n\r\n胸ポケット有／袖アジャストボタン／#ボタンダウンカラー／バックセンタータック','2023-05-28 02:10:44','2023-05-28 02:10:44'),(23,1,'1111-1116','in the attic 圧縮キルトフーデットベスト','active','アウター','3L','白色',6900,3000,'in the attic','in the atticのフード付きキルティングベスト。\r\n毎シーズン人気で完売する中綿ベストが、今季はスポーティミックスなデザインになりました。\r\n金属製の壁のような柄に圧縮したテクスチャーは、ジップアップで着ても前を開けてラフにしてもクールな表情。\r\nファスナーを綴ると現れるテープに描かれた英字も男の遊び心をくすぐります。\r\n袖が無いので、Tシャツやトレーナー、プルパーカーの上に着るアウターとしても最適。\r\nバック裾はやや長めでラウンドしたデザインで、オーバーサイズ風な今どきなシルエットを楽しめます。','2023-05-28 02:10:44','2023-05-28 02:10:44'),(24,1,'1111-1117','THRASHER 半袖Tシャツ','active','トップス','L','黒',3900,2900,'THRASHER','THRASHERの半袖Tシャツです。','2023-05-28 02:10:44','2023-05-29 13:08:21'),(25,1,'1111-1118','Fanatics PEPPER MILL半袖Tシャツ','active','トップス','2L','黒',3900,2300,'Fanatics PEPPER MILL','WBC優勝記念Tシャツ！大谷選手＆ヌートバー選手のペッパーミル！\r\n企画から発売まで3日間で商品化し、発売から2週間で3万枚を突破した大谷選手とヌートバー選手のペッパーミルTシャツ。','2023-05-28 02:10:44','2023-05-28 02:10:44'),(26,1,'1111-1119','RALPH LAUREN 半袖Tシャツ','active','トップス','M','黒',5900,3000,'RALPH LAUREN','RALPH LAURENの半袖Tシャツです。\r\n\r\nプリントや生地感がユーズドな雰囲気を漂わせるTシャツ。','2023-05-28 02:10:44','2023-05-28 02:10:44'),(27,1,'1111-1120','Coleman USAコットン半袖Tシャツ','active','トップス','2L','ネイビー',4500,2300,'Coleman (コールマン)','ColemanのUSAコットン半袖Tシャツです。\r\n\r\n仕様\r\n【U.S.A COTTON】\r\nより環境に配慮した地球に優しいコットン。\r\nドライな肌触りと、強度の高さが特徴。','2023-05-28 02:10:44','2023-05-28 02:10:44'),(28,1,'1111-1121','THE NORTH FACE ダッフルバッグ','active','その他','F','オレンジ',19800,12000,'THE NORTH FACE','THE NORTH FACEのバックパック『エクスプローラーヒューズボックス』です。\r\n非常に丈夫な作りで耐久性がある、人気のボックス型バックパック。\r\n・クッション素材のパッド入りのショルダーストラップ\r\n・金属製のスナップボタンが付いたハンドルで、持ち運びも便利\r\n・トップの蓋部分になる内ポケットはファスナー付きで小物の整理に便利、中にフックも装備\r\n・フリースの裏地付きPCスリーブは、PCを衝撃や落下から保護','2023-05-28 02:10:44','2023-05-28 02:10:44'),(29,1,'1111-1122','絡繰魂 九尾エンボスレザーウォレット','active','アクセサリー','F','黒',20000,12000,'絡繰魂','9本の尾をもつキツネの霊獣、「九尾」がデザインされた財布。\r\n九尾の狐は瑞獣(ずいじゅう)と呼ばれる、良い事が訪れる前兆に現れる生き物として言い伝えられています。\r\nまた、繁栄をもたらす守り神と言われるほどパワーがある妖怪九尾。\r\n\r\nそんな九尾がエンボス加工で施された財布はインパクト大。\r\nカッコよさを追求した大人の男性にピッタリのお財布です。','2023-05-28 02:10:44','2023-05-28 02:10:44'),(30,1,'1111-1123','PUMA 2Pニットトランクス','active','インナー','F','ネイビー×ブラック',2900,2000,'PUMA','PUMAのニットトランクス2枚組。安心の綿100％素材です。\r\n毎日使うものだから品質にもこだわりたいですね。\r\nネイビーとブラックカラーの2枚セット！','2023-05-28 02:10:44','2023-05-28 02:10:44'),(31,1,'1111-1123','OUTDOOR PRODUCTS 3Pソックス','active','インナー','F','黒',2000,800,'OUTDOOR PRODUCTS (アウトドア プロダクツ)','OUTDOOR PRODUCTSのメッシュアンクルソックス3足セットです。','2023-05-28 02:10:44','2023-05-28 07:39:16'),(32,1,'1111-1125','BREEZE/DRY ロングボクサーパンツ','active','インナー','F','黒',3000,1600,'BREEZE/DRY','BREEZE/DRYのロングボクサーパンツです。\r\n汗をかいても瞬間速乾！さらさら感5倍、薄手で軽いメッシュ素材。\r\n肌のベタつきを解消し、サラッとした肌触りを維持して汗冷え軽減。ちょっと長めの膝上丈で股ずれ防止にも。\r\n汗をかいてもサラサラ感が続くように、股間とバック全体には疎水性の高いポリプロピレンを使用しています。','2023-05-28 02:10:44','2023-05-28 02:10:44');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_03_10_132801_create_items_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'iri12345','iri@bigsize.com',NULL,'$2y$10$M4SZ6rJyiJx26C48wBS4MO/rC4aC9g59BXdOpHajk909KMqJpxcwm','IezLInCSV7uDi3V3QKBJWIzlmKPIwVWyHCkbnhNeIGHdtOOMs2eN37r17QpY','2023-05-28 01:22:21','2023-05-28 01:22:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01 19:35:53
