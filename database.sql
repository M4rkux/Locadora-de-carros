USE [master]
GO
/****** Object:  Database [Locadora]    Script Date: 28/07/2017 02:04:33 ******/
CREATE DATABASE [Locadora]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Locadora', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Locadora.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Locadora_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Locadora_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Locadora] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Locadora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Locadora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Locadora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Locadora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Locadora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Locadora] SET ARITHABORT OFF 
GO
ALTER DATABASE [Locadora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Locadora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Locadora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Locadora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Locadora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Locadora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Locadora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Locadora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Locadora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Locadora] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Locadora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Locadora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Locadora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Locadora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Locadora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Locadora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Locadora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Locadora] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Locadora] SET  MULTI_USER 
GO
ALTER DATABASE [Locadora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Locadora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Locadora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Locadora] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Locadora] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Locadora]
GO
/****** Object:  Table [dbo].[Cambios]    Script Date: 28/07/2017 02:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cambios](
	[Tipo] [varchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Cambios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carros]    Script Date: 28/07/2017 02:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carros](
	[modelo_id] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[Cor] [varchar](50) NOT NULL,
	[KM] [bigint] NOT NULL,
	[cambio_id] [int] NOT NULL,
	[combustivel_id] [int] NOT NULL,
	[Valor] [float] NOT NULL,
	[Imagem] [image] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Carros] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combustiveis]    Script Date: 28/07/2017 02:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combustiveis](
	[Tipo] [varchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Combustiveis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 28/07/2017 02:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[Nome] [varchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelos]    Script Date: 28/07/2017 02:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelos](
	[Nome] [varchar](50) NOT NULL,
	[marca_id] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Modelos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cambios] ON 

INSERT [dbo].[Cambios] ([Tipo], [ID]) VALUES (N'Manual', 1)
INSERT [dbo].[Cambios] ([Tipo], [ID]) VALUES (N'Automático', 2)
SET IDENTITY_INSERT [dbo].[Cambios] OFF
SET IDENTITY_INSERT [dbo].[Carros] ON 

INSERT [dbo].[Carros] ([modelo_id], [Ano], [Cor], [KM], [cambio_id], [combustivel_id], [Valor], [Imagem], [ID]) VALUES (46, 2011, N'Prata', 13000, 1, 3, 20000, 0xFFD8FFE000104A46494600010101004800480000FFDB0043000201010101010201010102020202020403020202020504040304060506060605060606070908060709070606080B08090A0A0A0A0A06080B0C0B0A0C090A0A0AFFDB004301020202020202050303050A0706070A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFC000110800E5013103012200021101031101FFC4001E00010001040301010000000000000000000008020607090304050A01FFC4006D1000010302030306050B0A0D0F090900000300040506070208130109231214153343530A11637393161721222431345183A3B31825525474A1C3C4D3D4192632354144455561648491A51A42467175858687949596A4D5E3F028363748768182B4C5383947626572A2C1E2FFC4001801010101010100000000000000000000000003010204FFC4002011010001040301010101000000000000000012021122610103A113042151FFDA000C03010002110311003F00DFE22222622220222202222022220222202222022220222202222022220222202222022220222202222022220222202226DF79051CAC5DCA2A7C58BECBEF228E7BF1B772A222B304444044440444404444044440444404444044440444404444044440444404444044440444404444044440444DBEF20A3958BB9454F8B17D97DE451CF7E36EE544456608888088880888808888088880888808888088880888808888088880888808888088880888808888088880889B7DE41472B17728A9F162FB2FBC8A39EFC6DDCA888ACC1111011110111101111011110117815B571475B7A69DD695ED531D09111E2DB8DFCB4ABE180001F94213DE58562735770AF9B7DB21972A139AD2BB7670AE456A22346923FC31AC7671DCE0F284D31F9C41225751E48338C1EB3E7780783CA15464AFEB1ABCA3C6199BCD3E7FEE6E9B11FCDAC09721D403F21B64A3D7CFB1F7B2532F1DFE1104F09BBF967E9CD9F5E6E0C703FB65565CC67932DD0FD75C2684F36FC7F945AE0AB7D478B97F5858FF0092EA2C695C3F812C7B966267C8C04176621E041B3D9CDE8995780F85D791BB7FBF03569CC6F8ACAEB0D9E2156D15FE544C7F835ABE7197D9294185E68F2024D3C7F0AE269FA356DFAC13C9E239351A6D4663293008924EBAC451B4679BEB72DED71F8875531279A60E31A7E8CE5A275C562DDD1307938078B52B56434C5AA98E817E16A373A5CBD519751795EAEE63EDC44DB7926F89B79E3F72B492FF00478AB87F4612942755CFBFD1727E516A607740DDAB307A522EC8EEA845FB9AD3D291146D7F66F7BA6B67BCEC63FBA69790556DDEFD4A0B6F8F1D55470B07C7221906BF4AB5611F77C3CE3E07FEBE44A0EB2F5E9B98E7A578947D1E2E7B282D5E1C83CECC7FF1DDA0DAD56BBDF616DC8986CA8ADF319873281D660CA9A982108417D9F56BCBA6B7E85AC7AFF002AEB11504707BD653D1EEC9E8F506A0552F4E16B79895ADABBE74E99EA8FA506DBAC94704F81C78FE6F87E507E5148A8FCA0DC8A8E9BC1A57CA3680E17EB252D4447C9737F26476F7ACF9318D04FCB0D9CCCBE663C5B036DAE10F1BFD83E59212403B40F87EC7764EB3FF00078D65E5A3F676BEE45B9CDC3FCAEDD0986351CACA5064AAECDD5B4FB0E8024A3C684D37F1E4D32107CF07C326A7764523325BBE15DC3D5E2CBFE65853ED66F00B97D095930E6352C78FBCD3EAE59BFF00186642226D9A22F2A9AAA29CACE11BD51494B824183B172DABD6C5E58C9B17AA808888088880889B7DE41472B17728A9F162FB2FBC8A39EFC6DDCA888ACC11110111101111011110147DCE1E7F6D5E4FC31547961646B0B895413428EB6F4E60D4929771FC1B3B21F9422C51BC1F799C859CA85865472874A6DAEEF755E5DAD61E0D9EDDBCDE2C9FB2E1C78FABD83EB09DDF68BC8CA565563F29DB656F1DD1AC3D70AF6D581FD38D7CF7672F43F8846F8FAA07D220F5695CB75D0BAB53B4BFDBCB2A18DA8A6599363DA4AD1449B5E97A509D9EA0FF00755FF94270C7D9F78AF8B89755E4A131EA997835656D30FF0096690D4F9458D2A9ACBF57E23228AEB8ADCC6E5ECD6588AACA8FF57E332EFD4751FEAF8DEC2B1AAC7525A7ADA24E420B6EAB9EFD5ED58D2AC9EFD5AE6BB977EDBD103E795BDCEA7E0F013F7CA646358A253305666678D0376A01F60275456D29A8832448666AB66A3C0CD8338D1E018B91D5115B7299A0B9C21FEE6E3FE4AB1BCA5C6A3E5397D1F584563F3728356F4C4A18BC617B7C1E4905C3712E8CF57929827A7B9AF2C62E47B995AAF2A3F8D789293265E23C99FD8DA653173B8AB74BD9D55D6F54DE5D598F279708E7B89D720BB6A4B8268183C6617C249ED1A8BCA295D66ED7FAD2DA38DA26519F2DFE974DD5031F68F09D58FE8C6A37E4AED7FAEFDDCF5DAA8D9FE94A872F2C442F572121D98FF09E8D4C671594050743D4979AB7F6ECE2DAF483A1F79A64D418D281D9F5D5A56DCD79156DDF4C34E794DC5F48CA7949471DA7C98FFF0030B31D1F9A58D2F23EB90FD2AD42D6976AB0755A3CAF27A4BEBACC4A11EBA279CE22B8697CD04F089A223131E3EEC7EDD52636239FBBC1B056EE98CD1513EEAA9EC5D64DEAF8B10BAC7117D5C9C7FCA47909E8D67ECC65AACBAE68287674ADC6A6D8CFC24A351CF51125D5BB18DE7106460EC7C46C41F783EF06B55FB332C6948BE8D94D7E6CF1A91ACA09C8BAC191499CAFDDFAAAA8DCFEDA7A064B1BAAB72DF51B88194EF1E438C9C3FE8F76027F23417AD99DE057E374D5EE15AFBD3554957F67E643CE5854B242F77C58C6418C9CFC83EB34F507EECF49DE2DCEDB7B834A5D5A2D8DC1A26479EC6498B59A957CE9DECCCB40DF3B79A33D1A37CF22FDDAD444FDB83D3D378CFE51B9083F9453E3C1C6CDDF4B5073D934AB6788F9E50EE87D02E5C9388E22C83D460E3E51BF0FCE33277889B6AA8888088880889B7DE41472B17728A9F162FB2FBC8A39EFC6DDCA888ACC111101111011179151D634AD2EDF5AA39D6ED307C652A0B5AF9E652C3E5968B2DC7CC05D881A3E107B7DB49CFCA0DB8F1FB1FD678FD92288F9F3DEA35552F9272DF8CA165EEE6D5DB6A3901C7C0494651AE36108DC9FBA001F59A7DD934D5C7992A53766DD9BFD07999BDB6CE2EB7ABE938BE8EA70939B4AED8C78F5084D41B12FB9F53509D669EA756BD1AA3796536D76E8C085146A22C7E64378D5871CDD6D65B77F5DBF5C8AA1D1305515B4B5BEE7CEC6DFB38F604724D318FB42134C9A84561DD02EFF002BFAF19CF56F41E65B018652735634F97A0C7A7A9DA0DB331FCE2DBD541BCC678BF05E5FA556C4A6F1DAD8BD57D2A9C06B1EDBE51B7FF74A6092A72D5DFAEB797AB2F77C9A7A7DDE9B9D452428ECB4F842C5877819EA0E8EC6E787D17EAB6506EBCE6A11B0C6A453CDE09720BD5C9601AF35C67AEEA17F77920A2334A6EC9F085AB294E989EBA96D70049FB92C6508C5A7CDE993E7159951F83C7BD5AE5C87495C19EB3BD6F2F54B56CC1FE91C297AE33B9738A4FD7E22A366736E417DF9E224044590F06B778A69E0334AF2C0BB369754FA9C6F8C83F9426A2EB1FC17FCF2550DF006B2BFD63D8E0FB59B408F87E8C63530FEABEAF7F7E09FCEB9BEAB4AD8BFBB18D5202217F529B9962B76C02E77AD5B1C03EC8741F66BDE71E0A94EF659F0A4A0CDDA96129771A9F48A4FFD55558176FEBC635463CCB5484F60B24453808ECC7C1899782C18444DEA9378F18FF63651A327D2917787E0ECD35164C1D29BC8271F601F5A3F506DF06A7CE2CD8F33053C5ED898D78929792E14CF0583CE69E6F8845E880C50F370D5998626B4F677AA0D1FFB2ECFF084569559BB4F207413CD299BFD5DD6861FEE4B6E66D464F264E6C3FC22CA35A43D555447EB4A4F3EF2A4725E1AC74E3A620498CD170FD2BE518F57E914C7719B5A562E1FD425114782029E8B2F21AC48FCDEA7E11604DE11754D46D070964C525ED260BD2329C5E27331F563F49F46B3DD1F5451ED59E8CF3CC7CF08523A74518B87A8A2BEF4CB55525795C36AEED53CE95C03A70780AD87D60F4F53AB4AC475A926679D50EF2AA61038DF338BEB4BD9F9B5D6679BEBA9031783D6FA618C733D2E10DB0B90B1A41D39798D20E61C4CE61A3990EA9B1351A8DE7935EDC3D82BA93D1FAE508D8E0FE32220FF0006BCE9AE7267EB32C2E096A562EB07F196BCB521375DE772FE0B340C2CFBA8DA731D19782647177063450DC8E78CF99907CF3CE0C7A8A34B7CAFBCE5FD74B911DE69B0BF2841ACE594BF513973B994054AC19B17D2B21591239D4913AC8B6E46641EA698F87A64213AC5B40A261AC95AFAE262DBBF3139CD3732F238BF264D357FE42F33731946CE3D0776983CE6ACFA53D4A4F6A9787CCDC13523084F364D31F9B2117839CBD1FAA4262A417EA2A013791E1F79A7A64F9C1AC45540BD51C7BCA55A9B4F1CC43130352FF1C1F107F84583EC0685ACA22BBA4236B58727B8E5188DC876FF0001362F6D409DC159C43E66F2770CCEA377F5E1BC3B790D2F39C371FEB833FA453D97A131111011136FBC828E562EE5153E2C5F65F791473DF8DBB951115982226DF7B6A0A3918BE25E654B53D3946C5639DAAE6411CCC5D639725E460D8BC8BB97321AD25BD94AFE7B66CE6F18D76934BBCC7FD660FE75AEDCDBD0F2398B9898BB3515BD1D2336CE186E9D4D8A7A435F9B8C7C31901C46E41F93D3ED1426AC6ECF79B1DE5D45519018E96CBF49609E9D7FED092421FB9E3C7DE794C7FC0A155597A6F05C1798DE4F4F3E7662778558D33379A492DDF8F21288B8F958C7741FCA400E5FA4A8599E6BA632134F4C8D08327107A7C4D3E1AC68DB7E3BC17EB5EE97AFC9F76D47C8FC4D5B8ECEBB3B675E8BAC1FFC2B9D2E61D115517B122C0FB77EFDD369EC45EE92C783F865AE369FE2EA83EFF9CC1B5F80EEC8A118FDDB77C6B898CFDEB7551FDA64FE7558ED55545FDA58D614B47BEBB3A17CEE84259FB6B917B19D37523E1B28B1B9B9FCBD3F284D373D58C7C4279B5906E3E6A67EA5A1A7730376ABC353F495ACB9751D157568A809A771B2D2930D06DC7111F04D191064D47E421388E08E34C6CF51505D5EB5358FEF711737AD2553FBD67FE75853367BC4F3D3BBC64295B6F182B732ADAA8A5873C58DBC73C3772F4BBC2134CF0EEDF0C831BD23720C83EF3BC5861E7842FBC23F6AC6E56DA7F2AE5FE3893134BD672ABFB4889EB3955FDA445061E78411BC6485E154995B079A6A4C7F8C2F21DEFF00EDE3C4C5FF004B396D0ECF2503CB4989FDEB4954FEF59FF9D70FADACF7DA845AEF3EFEADE3E4DBC7CC458907DCB498F1FE0D644CB86F0EDEE99AAAE6369B85CC850808D785F754BC25BE8FD3663D4EB388CFE4C7DE7C9A4C4D567696AA758FE0641E0F34ADBAF2B7B3F697FE91AED5234FE9FEFDD46DC64F47A8B1D5796329B94A0E6DE67D6EA5E27D53BCD3F5390937543C8E69A7A9C421183618C7A64E20FE4D5B163EC8E4D2DF666E1289ADACCC6CE53D507EB30E134C0FC8426A69EA3B27941E9A851FABAEBEC83BAFA3B28EB9AE194CF86515AB8D18BBD9D3F8FBAA4A9C9092FA31AEB37CF1536FC7A36E72F777A71CF7A3B72F300C7E53884D459773A933952CB247C0876E5BEB0B5F8E43530164AA8E9074C39E76631907C3228E55CDE9A560261B73AAA60EB487A805218C5EA4AA379F5BF8831B41F6641F57C3ED34DC24DC32BC7DDF6751C7E09294A5AB168FFBAAEA97791A31F9B19386B865267D5193F4C95B69E0EED9286D7B36F40D790931033D224A7AA010E46187252847446FEECD320F509E507F38A43BC94335D6E0AEE8AC64E838FB322EB635F3EF3A5E42C57751A9E66B878F054DE062CC9ED1A8845E58F4D7BD45BA67D29802FCDED15E1722D06D7F07EAAA8879CEF4FDB95B768A83145AB6B036D2E030BA928CC0FA4A1CA4C716D882D4D32778A49C7EF04A91A8FC7B2956BFE54451BC703ABFB0BB31F1E6E6F81049CFD10478FF00E1F6DE29DF9D10C8A8FAB22D8C81301AA3CAED06FB18CBCBD42D38CF53E8D4726EC0CBBF1F17EDF06AA0CCD712E8655EED4C7495C6C99D0F2AF34B91CE48C07809F36B1D55961F77BD5BB301BEA6992807232F2C4580A8DE60D3279B26A0D61CB4776AF94F5F895B1B706DEC6F3387D4C7D251BA9A8DDB909EE32109E516721D38F74F8414195B77555968326978A81A6ACFCF4DEDA7C8FDC464E8A7368F663181F93C970F864D322DCF72F62F9DBBB970689B3716192B8CF1F31C1205D08B2B68B23BD42794EED6D5B747E6F662FDDA77F6B6E2CB73FAAA8CDA3D829126CE23F8B27504F7BACC1EDC7B7E4F6F688413411111E711136FBC828E562EE5153E2C5F65F791473DF8DBB9511159826DF67D8444107B7B6E60296A1DDDBDB1B573CE430A92784E663CD73818FD1F109E8D624CCC4F59AA729AF5A5CB25EC92C180728324A52D4B3024A92434FB3D4EB34D74F35D67EC6E6F33073D702F46D9C24952F32E21205F44CF3863CDDB8C9D58F4C9DE2BB728F968B7B46B7958DB73984B86061ABC8751AE6A82713CE1063D427A450AFADE8A110B7E065FA837595BA4AF345D1F2A095946AE23A5211F4F100E2408320DE0C83D4EAC9F0BEAD69CF65A09895270B25B58BEFBA6B727E4D7D5F53F955B1AD5E74F17A18EF3ED992173A27A427115ED0F6AAD5C37C14CC47E6DAA5147CD95D7F47C91C7E582E44AF236B0DDD6FB1F9CA8E431FE117B71D92DCC517F5AF76D31D9E73A61D7E30BEAE2E6DCBCBE588A28D70EE55C7690714328F073928898F5084EAC63C02E2109E4C6B15937A064245D55C2AD5D7DCD696A427FE9CAF070F9FF00CA3E5D733B69AEF8672B8C8BBB80A7A52065206626E8EA62409251437F1E467D200D42135083D4D4D3ED34D4FBAD73C368266B9ACE368CB41474ABC2743D6B424FC05232125264BA9A7CDDFCC12374F9C70C64E18C9A63D48E1F78B605FA28192DF7D834BB67F3765AA4FCCD07BCB3297A98CCC2D5DED2189D6959587A83509FEA68342F983CB2EF0DBF9370FB68DC8B4E9E9BA6E07A1E9C15754E3C7CFC82D423C23C764ED1E3C78EDDBC213BC22C7E3DD7FBCC8BB3FF0077ED3983FC0322FA24FD11ECBC3AF82E5FF3007FB9AC44C7E4956D3782E5B0B24CC353D9DBC9493270E46CBD5056569E423634642134C6323B20B87A842601FCA29C07CED9375AEF4B2F55909A707FE2F87F935CDFA14DBD434FFF0062780C1FE2F87F935F504E1D5B1FD99222E83C7F6C7EDC224147CC60F7586F37E7183A77288C5A33D5F749636DD372134FC98F4D6C832AF4E58DC8F45D2B310170A8E695811AF3A7513548BA0C70F2841E98C641BD18F86CC64D3E1F69C4ED16CCA62A3B56D7B622C5D782FC59F86A5DFF004CD36D65598C44C656D25A78C64F93224136BA2E2660AAABDD545436C455BDB97D304942352924AE08F00E4083D426A0C842757C350FEF2661E62CDDE4733151D2A0929527B46AE636A31E31C7F67EE4E6DA8322D965373D67EBC94D6FA9BEDEC773CFB5A926FF00935236CFE57AC6D64DF06AB3231C04ECA204CDA7E0D3E6EE7FA5AC7CC26F27B639A0B7F464952F6DEBF23C8F991B5AA1B4B4311D34901907A64F9BD4E20F4D62270E833D0F8C303957A9A29CEA931945111720F87204D4EAF883E18FCDF935BEC71923CB4C0C5F3C146CABB30FED99E228C19A0A229BA7098D9D38CC836DE74844835A948BB5F782BCAA28FA6E52C9BE80A6E979426311482E4109A841908477A9C427563524EA36A16ADF5C5F3A25951B5241293584CC6AD5BA14E690F00745520318B472613CF72F2F5BC9AC914DD1B768BF5E181B1E0D3ECD5AD5F5C5B7B939CBE4C66B6E7B3E7C6665E8FA2610A5E474A4A13B3F37DA79B1916A6EE6E77333F76AE862BB3515E4986328275CB618212508D00C3FF90031EDE18D136E359C373A98C619065A6E49D68FCA2EF8E88F21DAAC4F902CD91738D623056D531C7EAD68C7C38FAC7487B3073F6E4EA2434FCA71353CA0D4AC1D1BAA0D64518BBD470551D03A5B16487946FB3D4AF29E52E6EE5059838B66C1E39986ACC7CE482E415CE9710831AB859CC84434794B9978928D648289BAD73E068FB8D4FE3A56B266374CF9F8DD69794193506B3BEE94A8E4986F0B8D0C59BC4DA529794652831757A7C320FE706351AA60A612CD1BAD2E80ADCE7CE8C33E3706A0E710A5FE503E1FCE0C68A37648888F38889B7DE41472B17728A9F162FB2FBC8A39EFC6DDCA888ACC11174261D326910E4CFCFA011B6C78CA4FB0C0834F07BABAA4989ED6F6F213D20EBD2108969F304F29CA91F879E758219D40CA2F39B7CAEF4E4C51F65834E4E608B2931E988A31BBE67A9D669908B98F7A733946C874F56418D8308FE14E79873BD31F9B1914E6F4369B179AE7621FB0F176499B43087FAE4B577199C30BF6781E30CDA457209DA8AD548635DCFAA979D723FE580D71EA775681E24C6C2EA0BD26BA17D2CCD36536A69DD51BAF471720A6A8E51E7DB78FD2AD21DA3CE6D2B682F2D1F76AE35E095AB9852F3DD225808DB7248E76F3DC641F0C84269F68A5EB4F085F2C5283D68BCB7DDE7783FB8D1FF9E24C6C5DBBFE743D6F6FE957EE8EDEF89E956B9C7E11D65D463D161963BA84F928BFCF1253C23AB3317D6E516EA7CA962C7F8C2A26D8A3CE10FC5AC451D77A04A734C99CD9B6F693D4DE0FE9C66A367F547F67DD755933BA04D3FF00EA917F9458733B1BF1E89CD2D8792B0F4BE5BEB1A45FCA4CC5E3F5412F291EE871E366F06F3534C64E21387D5A28908F334B301798FDD84EB574E4F3552451FEB97DF5AF425FDA54A3E79F54E5D4E4779EA0E3F07E30BC179991B6E21EB7D52D76F1F9AA362FF3C53989F352666DD97D8E78B0CDE0BE6F2663FA379E13DD85E2A89156666E956BF00BC1735D7DD30D1E3FC22B0EA0BF15E4F3CC0F297ADA571B6EC892E218C9F369313E6D9DC1309EE0E2A99996FBC8669C8094EB462CEF9DFE8BF805CF20FCD157B6CF39B9A8A707AC2CC25463FEE6BA5498FA46F5C6E9488EB8EA31E631D74CC8635A5567BD8F33822638DFAB36E834D3EB785CEBF08AE4A6F3F59D8ADE519B3A3732D235563902F21AEA35E2109E5064539A6D9DD3F4BF3AEC57837128334A49B666D43D62C85BBFED55FE99B2F8E7B31754B495A85E3F2697366BC8E6E3EAF4FCA713515FEF28367055439A927C3EE3836A49175C2ECC63D45451A80DEB143DF7CDCE689B65C2C1DBF3CAD3166E1871D292247436B1A398763D47042109C3D4FD40FE49456AF3201984A4A2DCBC98B7B1538D9B8B9652D1D3CDE448DFE4C7C45B4DB1F950A0F341792AA8DBFB24C6A7AFE1D812A599B14D9FBC044536E1FEA1071F25CD89A8F5F9387CF389C3D4D3ECD62ECA9DAFCA8E7FF2DF5CE6B9859987CAD9AD9CC8D916A4B76590C6DDB934F508476D084273918F87D5E9914D343ADCCF573BB699DF0DAA7EEF9717722064207C7FC634F9C03E53507A7F28B76B45B50CA52ECCDED396417156A52EA5AFAAB2D39A884B9171A05A35ACED9D511752CF3980E230AA21F50641CE302769A83FF8D41916D4E9BB5531590F1CF511580F1C53C2F3A8B28B534C8DC9C4191528517539A7025FB05E6BCA343E4D737D4F176BF6AD600C7F2A45C2E32FB7B05F059D684FE5483C779440753D8567D41447B3D4ABDA42C65F218FAE1E3FEFA2B6E62D55EC6BD68797FCA8683175594B9843C66D0EAD6347F73E9CCBCDC0A32BCA9EB06314FF001D50DCF4E36725D323C703703269FF00C778B3DB7A0EE43A94E8C9F8727209ED169AF7A45C797BCB9A6A9EA28A91C0482A4DD740C08C45EAC6D3878C9F284D422563ECEE91AAA1EB1A4A2AB586372D9CB311BC6A4F2641EA6C5ECA86DB85B30B2399FDD3566AE74EBCDAEE4874E122A4CDE2F16D23860E08DFF06A64A3CE2226DF79051CAC5DCA2A7C58BECBEF228E7BF1B772A222B3056C5D3827957DB7A92938626CC0EE4E09E356C4DBDE1044C0AE75C2E8BB1AB6C67C5FD60D07C7C58F94F511701B33A228F9C1D734B89C0EA8A7C50C4D41E9F0DC13CDACEB1F76A06E347E3094FF000C17146A664A6592B0AF2B9737B2DCDC8634FD4E4744C6292D2ED3CE0F88B11579BA233755BD686ADA1A368E927E42F2CA5A7EA81B1E784F36418D146B41C459E88AD1FD2128627D6B7E46A2D52F67D60FB41F67E7174DE4CD482786089E4AF33F25A98C7F36CF4FE73E516C2EE26E38DE055BCA60A90594B9CC7243F6859284ACA2F883F29EE85694A783EFBC52524FA61D654AAED6F29EA7DD7CE11C6A2F388494BCC87A43EB5CC1397DAF46BAE5934FE4C8E09F46AE4782A6DD11C99FEA72F547A5D245D327CE11BFD1A96EF3700EF1A740D12E58EBF27DD32916EC7E8C8E17663F7106F328B1F33165BEBBC183BB64EA1DAFD1B84112E51B730A6DE71A5786D49C2295E734D3F47A7F38BA0CCB4AFB8CD4E7239E76A48D75A84FF562114C3C1B86B795FBA76972C7576333C172353EB1EA0F89A9D6738D4490DC2BBCB1F8F0332E5BEB1C7807FBE5330EEC7E8C8E1043C987F1BB64300AA3EEB85D245E47FE674D50CFABC7D16CC9CDB5785CDB9E69FCDF0D4CC67B807793351EB0B2EB51E0D4ECE367A1D8FD1B81AEB39F07DF7903A218C5CB44E72C9DABD99A6C84F48426A2084EF0B4D91BF1635891C93B5D51E327E51241D6A8F99942EB89ED3DDBA9A7F38453871F83EFBC9DD37D2F5819C1E0F2B7062C9F3647841AE167E0EFEF2013CE92F58D1FCAD794DB4FA320D040F986A17520D99B00E0E590BC8E18BF2631ABC35430CDF0045FA81A9A4DF7036F0886263785B3F45B1C7F6CC95DA8BE1FCE2F1E6372166D1AB8FD345556BE3BCEDC1E75F46DD2021B3C9ED5E08B6ABAADBDABA26E0F3C35CBBD90D49331B5263111C888EC842777A63527E0F7305D42BCD17F984B78C7EE613C75F93599AD9EE06A3E77906B8D9F66AD3076A284816F83E91E2D80D4BD165F505504AC0CF536EE55B3C2F09CB612939BB6E7AA46B99C6C2A0EDEE392989417222DB39EAE2FF8E13BB5B44A3F7176EC7B7CDF9ED6578256B1783FDFBB82DDA0FD1B6D35EAB3B55963B0443535632368BA7D993ADE89941EA3CF384D4D422EE0A266649E8D67EA3FA375B53047C58DA8884ED3BC27CA1389F28B87351336AF2D365EB0BE5792AA69014F37E66C9D4B39EADBF3820DBF13D22F172977E2D8D3917CCDFDC2831EA779323FCA2B177C75A597DE6B9489BC90E5AEE9D24D65E42562E46564A45F931B0D36E4D4D3D41EA76831AA08AF4664424F7746F5AB7B9ADB041E95B4B7B27BA3EAC70D9F91F121DE49F11838C64ED1811C0F5064EF0841F76B1EDE8CB7DCCB3F905CC96526C6D21CBA92E06655C45C5C444175FDD92F303E60CF507DDC5B1C642777CE5658DDAB6AF3FBBBA6BEA36C1D5D7069FB854AC07B8862A79F3C911C3C5BC66423F1BB76418C6D9B8E406C08DC7D67109DE294D49E62B307495BFAEEA3B716206D26EA77528F6978C9686D3E9494E27D7020DB0F5389A64D4EB09A7A689A0E6F48C82D37942C9BDA2A93D580EA0B8B69E187EAA0452EA12520DC106377C3FB5C6F1D8F4FCE11499DC974BFAEAE4AD9C6F4973AF51F3CE204452759CDC7A6461FEAEEC7E8D60D61910DE1B716DB6606FCE66EF95BDAB985514BD48F5D3614CC8124E3C7D164D38F18C8CC6318C6418F4C7E4D5C3E0F1DFD9DA5F2CF50D362346E0E782877A22493AEB386F1BFE283F4683640CEC38556E2C6055AAE2FC5DB2FC15E41E3F37283558EEFDF82FBD0E3C7E69D0F1A28F4A4EC887F643D5AB1AACB2C6D3C7A41573B8BB579B9C60D5B6EFB1F17B312ECFAED5485FF009C76DE44783EE52208CD7B22C366ED5D67782503C8C149D2F2129E8D99083F9C5A91B67BBEE7AA7CADE398ADE35A1E62A486909E7508586D47E3871934DDCA3477A9C320C9C4D3D3E20F516DAF7D25C1A6E2F76FD4E1A73539FD613D174B89B69699388F3509F36D08B1459FCA0D6C2A1CD47C0D78FA55855026F8E92966CEB97A70F2648FE9767A9DDB7201F8FCDBD1A26CE3E0ABD2F3B476E8881A6E7B660E70CEBCA903E2F372041EDF9CC045B22515F73AD0AD6D9E44A9DA0C421E077173D38399D3FB77A51DEBFCE78D4A844C444DBEF20A3958BB9454F8B17D97DE451CF7E36EE5444566088883E6B3399782B5CB7E672BFA3EA20BAC0CE2EB794009F316BC818C7CF09A7C3ECF87A7E9163767BCD82C3AABA8D078FBB21790A6AEFEACB4C95119AB95ADA3E236122ABC6ADE522FC42D4FAE03D31B8F9C1B427CA2D41669F2F31B30DE4AAAA6C3A78C65E7A3F28327D271351144B16FBD8E785FFC4DE5F9B7445438DF0CF1875B73883C1F75116AA65205E30263F63DA2CB17CF251988CBDD9FB6B7F2E9D15B1A52F76A18929444AE17C338DE371E3D9A9B31E9F544E260DBA7B7DBFB7FFB904FB1EF9FD5EAAE7131FF002F5DCFD17CAA9D0FDC15AFF4A2D47A20DB23CDEDB5E7BDEADBFA67FDE2B7A537BBD6DFB6AE10FF00CFDFEF1463DD91BAD7305BD4EF4C9D93B0F2F0716EA0E9BC72CFE5AA4293034037D418C78386327108426CF63FFBFE25282E8F8239BDFE8D9CC11F4751543562D883D4E794F562300C7E4FC523CDC883C379BDA2AA37F679FD32BA6E37A5554EBFB31FE99FF78BA2E3C163DF682269EDCAA4763F355E43FE72BC795F063F7DA45FBF92C21FEE5ACE1F1FE3882E371BC86A47FF00D957F4A2E171BC12789EFD54D3FCE8ACD75E0E16FAD6C4C5CAC87541ED3B99F8AC7F8E2F124F701EF92604F1B9DDF15C6DFB9C2DC9F46441929BEF21986BFD9531FF003A0D7647BC8A78BB3C629E624F36E86A2D5D3DDC1BC06CF4E3B81B8D92DB9F14E5A0B51CEA512F318C63FD5F2F5063D3FBEB0A0A1E48BC61471F1E0F348362CE77824F17ADDBCBF955D0799E1317E151AB5E5B44EC3EF0F1E04D6277E45C584F5799D709767B30F83D12E81F3AF1A2EE30283EDA3E45D60C466CD0D8F060FD91895D945D0EF26220C510B1F391FB7D3209609624CF8C3C58F585258307FF009A92796FCFD5E0A2326F72332D61EB67D0150C7C093488460CDF0FDC720CC7D4107A7D5BF193E4D6BE876479FD37AC5E460C7A44E213D20FE6C9F36A40EEAFBD2CED0578F28FAA20472AC06FC7365A7DC8B963946E31E9C9B3D3F28CC9A9FC9D4C6D6B77AE66B78A34C985619EFDE2F75661DD195052436B6FAD9C889BB17728F3F7C07A631F361909D58F88422CF5397F6B0B051D696F0578CC950537543A1C751A314F0DA3F18DFB3D41E80DCE98C8F34FAB6FA9C4E228B79B4CE2BDDE3BBCFAC6EEFAA4993E8DA229BAE29FA85AB7E8B1F37AB00366E240929A9D9B318F4C6DFBCD571DDABB25693DB9D5A7B3D3BBB445C130FED652F4DE3B70DA47DD5D1728C29B18BDCFDD939C34EB3BC22F40B3EFADC6DEB7974CC256D4ADE5CD154D51D819CB6938F6977D36D5BEA4C371D3E4E7033EA37D46CE39C7583ECF5387C351BF23777E83B1964E1035E46C8F3990866FA5CDA648C49A7A8F09D993F8D8D5F776F795E66EEEEE38A332AF981A6B1BABAD72279BD3D4BD48E367BAE620C7A7A8F09DA0C9D447909DA6A79C566509B8DF78B6F0C6B4E5D5CB5DC8A5A92B5FD0446303504D4E930748733C7CCF9C73710C84E268758A633CC3E7232DFD93CAD58E3EF0559109F48AEA83CDED8DDA4C1CD6F05760FEFA37C7F48351A6A0F055F7DAC093F4B9996B572B83FED1BCC1F491EBC87FE0E16FE5A729F9599673D44C8BC61B70747C1B2AA1BEA49EA13DBF236906318F4FACE263D8A8271C1E6D2D8978D1799CAB9A63F2A28FC7F8357547E680CEB83179B427F2DA7078FE8C835AD669B8A7C23F69B3C6DECA53FF00E9BC1FE70A12E0CE466CE8C99928098936B81F45BA2327432B5EAC832699126A36B7BCD3368CEBCBD16132A22B85EAA9C8E5252ABA8DCF35D3D4273323769C31F57FB6D4DBCA564A4B979B1556D94B8979E5090928C5E4D307311284069B77E4E942734D3D4703D3E26A779A9C35F39762EF4D55F557D3D7CAE5BC23E79D29C875A621934C7C41E98F516F772C42A92C665DEA4BB2FCEFABFACEA828EB5878424A1084241F3C1B36F1E3E2759CDD8BB18FCA2269EFBB89AC930B3753C3CEEA73C6172EA001755D6A63F867D9A914A34EEC7AC03736C454771C23C630CFDD09D7C21905C8F17BAFFF00E149644C444DBEF20A3958BB9454F8B17D97DE451CF7E36EE544456608888235EF2BC97833A196D90A260B40755446A3DA45C38F683E79C8EA09E4C83E1AF998BD15BCBD075ECC5ABBAB47BA83A861DD1194CC24B0B4CE32768320FE707D9FA45F5F6A05EF5BDC9167F7A0C3E09C96C70149D70D43A7155F30823F3F10FBA3E9B8D981E0FCE20F94AB81171B0D2F8CCC390460F3AA5E44C3DA8276119D365A9245F43B02931B0892BE21071FCBEB34C7D5FA35BA6A87C0B4CC513062E81DE034B3FF00EE9510F01F46E08AD03781559DC0E2D5659C4B664F38D64C7F8250E1469A8B04CC5EC350489B1F76417217B147507273F5033816102EA465E41D0C119131A2D43B8704EAC7806B6E7FD460EF14113C42CDADA7C783EEA94FCCD6C7F7536E0BB6FBB6DD8EE63BB714B56372B60B91EAEAA39D70E88CFEE1073718DBF9CEB3CA2EC5D9E0F9EEAA75BB5F27A425D48B1ECBA57108394AEB91B7D9618367C1233662F1767831E3E5F94293FB7B7610ACDC64BFFF00D64751FF00F7BF77F935D633ACC7ECEAA028BC5FDF979F9BAA26BED163A3CBE69C7EC8685A231FF844EFF365D77351E6CC5F06B5945E3FF0B9C7E6683257271A78B16CF67FFDAC5A4ACB3742F7AC6D164FF0F1C7FB397092E0E7185FF56FA4B1FF008C627FB396CB920C972314C66A39C44498F611B3A110651FD9E0C6BE46B30796A0654AF9D79976A9998F6BBA22B278C83B482EB1B8C9A8CC9F283FA45F5152774F3C8D307D6BCA2D24EFFB775B91FF00A7AD666F8DDD0F9F3DE5B5946DDEB5D96AA0680AD59B5E653137B6EB73B1CC37C1B787A83E8E1F107DE2F328D1CDC881818C27AA4A703831F45CCF3D16A7683EB158775AC3C8D375347BBA4883918EAA3DD34E8DB0B1F2F68884E18FC5FB3DDFB45B16C7E0AD6FAEC03C41D9B2DA63C1A5A7ECD6DB7ABF44AFBCB4783A7BE6ACF54CC23EBB8B8895A13A43527A97A6EE83762EDE0FB418DD1044E6DA9D59083E22DE3F83647E0CCE4962F2BBBB4A325EA2A71AED9FB893AEE7250AF47B31E3C63F61BB7FFC1E21F8FE5174BC224DDBEF731197F8ACD458EA0C2EEB9B5181C19CB18D61C4938726CF758F00F675841F583F94522EDE5E8CF450949C6D12C775B021E2A1D88DAB08D85BBF1641B76E31E98C63E18D7BAF73559E4623E16EC79F3E3F277420FF0028BB20F95F83AF2952FC00DC86C4F6E226AFA3FA420FCD915935E164AD7DC061752DCBCE638DBBA1BD6A5EB39BBC1F78B673BCEB711671332B7A9DDF1C936EE598B58EE6DC91D5474D39B974F9E208F3EDC683117DCC427683EAFCDA8AE7F07177E9366F8D99B2A581D372765B2B18BFCE54C656C81EF318EB415453D7CE06CF60AED851E290FD2BC697F4C541F38F85F30FB66309D669F67E4FB4BA32F1BD5725D924CCA5D6CE2D92A92E4DD0AFEEDB99033EA3A6A8C1C30DB908E35063E77A84E18FC98D4668EF07437E2D38FF00A4A2F27D24D1D37272C4E595671F8318FCDE31BC57FC46E92F08C619BF436CCBED5783013AD7A39D8BC6EFFCAF5353E7168EC5174BE6A33D79CB81A5A6A1DA31BAF5E087174451B10D74D85B7A6FB49020FF006B69B72134C7D66A10842710835F4E961ECA517978B314B58AB7CC79B415210CDE322C5F10C43D3D8B583BA6EC4575BB8682798706E97BD133706A410FD595C89B9E8376FE43C98FDD9C20793F49A8A75C7E766F2BBC1E377BBAAF287FB7B21FFDA0BB2090BE3DBF1A78F6FC6B06B3CDEDCD2FB05C87DDF1F9C143FF00B457A6CF33B5EBAEB726D7481E74315FED05BF5E5C4386635F257BD9F2DF1996FDE6F7B2D33E69B1AB67956BC9B81DA4FB5E4FEB80F4FD2107F26BEA141981AC0BFF0055EB863F3828FF00CF16ADFC209DD4F988DE7554D277C32A5976A8E2EE2D36D7A326764FCAC5B4632F17A9A83E273CEB064C64F932293B68F9E0A9C7446CED83B18F1EAF2C5F364FCA2D9AE48F37347C359BF5D42DC87D82B98B143820611CB523B6930DE33A40838B69A7D5908E1FEA1353B3E228C8D7C18ADF89B0983C597D84E1FC77022FF2AB3FE4D3C1FBDF2741D7D1743DD4838EA56DEC84A0C9589612B68F3BEE6DDA734C1D9109D5EA20DD76EABA39E51190FA0D9CC38C667924D5C4A3B744FDB0476EC8E353E5353C6A48AB5EDEC50697A422A968BA47A1D8C5B11B56AC75478F9B8C7834C63E1ABA17A1311136FBC828E562EE5153E2C5F65F791473DF8DBB95111598222202222078B67C49E2444044440444404444044440F16CF893C5B3E24440F16CF893C4888088881E2D9F1278B67C48881E2D9F12789110111103C5B3E24F16CF891103C5B3E24F16CF891103C5B3E24F12220222202226DF79051CAC5DCA2A7C58BECBEF228E7BF1B772A222B304444044440444404444044440444404444044440444404444044440444404444044440444404444044440444DBEF20A3958BB9454F8B17D97DE451CF7E36EE5444566088880888808888088880888808888088880888808888088880888808888088880888808888088880888809B7D8D9E3444E4E1C7ADB3BB4445E0FB767FAEEDC3FFD90A, 9)
SET IDENTITY_INSERT [dbo].[Carros] OFF
SET IDENTITY_INSERT [dbo].[Combustiveis] ON 

INSERT [dbo].[Combustiveis] ([Tipo], [ID]) VALUES (N'Gasolina', 1)
INSERT [dbo].[Combustiveis] ([Tipo], [ID]) VALUES (N'Álcool', 2)
INSERT [dbo].[Combustiveis] ([Tipo], [ID]) VALUES (N'Flex', 3)
SET IDENTITY_INSERT [dbo].[Combustiveis] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Audi', 1)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Chevrolet', 2)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Fiat', 3)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Hyundai', 4)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Mercedes-Benz', 5)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Mitsubishi', 6)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Nissan', 7)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Renault', 8)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Toyota', 9)
INSERT [dbo].[Marcas] ([Nome], [ID]) VALUES (N'Volkswagen', 10)
SET IDENTITY_INSERT [dbo].[Marcas] OFF
SET IDENTITY_INSERT [dbo].[Modelos] ON 

INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'A3', 1, 1)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'A3 Sedan', 1, 2)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'A4', 1, 3)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Q3', 1, 4)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'A1', 1, 5)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'A5', 1, 6)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'TT', 1, 7)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'S10 Cabine dupla', 2, 8)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Onix', 2, 9)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Prisma', 2, 10)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Cobalt', 2, 11)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Captiva', 2, 12)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Spin', 2, 13)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Montana', 2, 14)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Palio', 3, 15)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Strada', 3, 16)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Uno', 3, 17)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Siena', 3, 18)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Toro', 3, 19)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Punto', 3, 20)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'i30', 4, 21)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'ix35', 4, 22)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Azera', 4, 23)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Classe C', 5, 24)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Sprinter', 5, 25)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Classe A', 5, 26)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Classe GLA', 5, 27)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Classe B', 5, 28)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'L200 Triton GLX', 6, 29)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'L200 Triton Outdoor', 6, 30)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'L200 Triton Savana', 6, 31)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'L200 Triton Sport', 6, 32)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'March', 7, 33)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Versa', 7, 34)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Sentra', 7, 35)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Duster', 8, 36)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Sandero', 8, 37)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Sandero Stepway', 8, 38)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Logan', 8, 39)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Etios', 9, 40)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Hilux', 9, 41)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Corola', 9, 42)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Prius', 9, 43)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Gol', 10, 44)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Golf', 10, 45)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Fox', 10, 46)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Saveiro', 10, 47)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Voyage', 10, 48)
INSERT [dbo].[Modelos] ([Nome], [marca_id], [ID]) VALUES (N'Up!', 10, 49)
SET IDENTITY_INSERT [dbo].[Modelos] OFF
ALTER TABLE [dbo].[Carros]  WITH CHECK ADD  CONSTRAINT [FK_Cambio] FOREIGN KEY([cambio_id])
REFERENCES [dbo].[Cambios] ([ID])
GO
ALTER TABLE [dbo].[Carros] CHECK CONSTRAINT [FK_Cambio]
GO
ALTER TABLE [dbo].[Carros]  WITH CHECK ADD  CONSTRAINT [FK_Combistivel] FOREIGN KEY([combustivel_id])
REFERENCES [dbo].[Combustiveis] ([ID])
GO
ALTER TABLE [dbo].[Carros] CHECK CONSTRAINT [FK_Combistivel]
GO
ALTER TABLE [dbo].[Carros]  WITH CHECK ADD  CONSTRAINT [FK_Modelo] FOREIGN KEY([modelo_id])
REFERENCES [dbo].[Modelos] ([ID])
GO
ALTER TABLE [dbo].[Carros] CHECK CONSTRAINT [FK_Modelo]
GO
ALTER TABLE [dbo].[Modelos]  WITH CHECK ADD  CONSTRAINT [FK_Marca] FOREIGN KEY([marca_id])
REFERENCES [dbo].[Marcas] ([ID])
GO
ALTER TABLE [dbo].[Modelos] CHECK CONSTRAINT [FK_Marca]
GO
USE [master]
GO
ALTER DATABASE [Locadora] SET  READ_WRITE 
GO
