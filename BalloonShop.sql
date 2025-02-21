USE [BalloonShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](256) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateShipped] [nchar](10) NULL,
	[Comments] [nchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](256) NULL,
	[Phone] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](500) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[Subtotal]  AS ([Quantity]*[UnitCost]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[Thumbnail] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[PromoFront] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [varchar](36) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[DateAdded] [smalldatetime] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (1, N'Love & Romance', N'Here''s our collection of balloons with romantic messages.')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (2, N'Birthdays', N'Tell someone "Happy Birthday" with one of these wonderful balloons!')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (3, N'Weddings', N'Going to a wedding? Here''s a collection of balloons for that special event!')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (4, N'Message Balloons', N'Why write on paper, when you can deliver your message on a balloon?')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (5, N'Cartoons', N'Buy a balloon with your child''s favorite cartoon character!')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (6, N'Miscellaneous', N'Various baloons that your kid will most certainly love!')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (1, 1, N'I Love You (Simon Elvin)', N'An adorable romantic balloon by Simon Elvin. You''ll fall in love with the cute bear bearing a bouquet of roses, a heart with I Love You, and ''a'' card.', 12.9900, N't0326801.jpg', N'0326801.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (2, 1, N'Elvis Hunka Burning Love', N'A heart shaped balloon with the great Elvis on it and the words "You''re My Hunka Hunka Burnin'' Love!". Also a copy of the Kings Signature.', 12.9900, N't16110p.jpg', N'16110p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (3, 1, N'Funny Love', N'A red heart-shaped balloon with "I love you" written on a white heart surrounded by cute little hearts and flowers.', 12.9900, N't16162p.jpg', N'16162p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (4, 1, N'Today, Tomorrow & Forever', N'White heart-shaped balloon with the words "Today, Tomorrow and Forever" surrounded with red hearts of varying shapes. "I Love You" appears at the bottom in a red heart.', 12.9900, N't16363p.jpg', N'16363p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (5, 1, N'Smiley Heart Red Balloon', N'Red heart-shaped balloon with a smiley face. Perfect for saying I Love You!', 12.9900, N't16744p.jpg', N'16744p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (6, 1, N'Love 24 Karat', N'A red heart-shaped balloon with "I Love You" in script writing. Gold heart outlines adorn the background.', 12.9900, N't16756p.jpg', N'16756p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (7, 1, N'Smiley Kiss Red Balloon', N'Red heart-shaped balloon with a smiley face and three kisses. A perfect gift for Valentine''s Day!', 12.9900, N't16864p.jpg', N'16864p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (8, 1, N'Love You Hearts', N'A balloon with a simple message of love. What can be more romantic?', 12.9900, N't16967p.jpg', N'16967p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (9, 1, N'Love Me Tender', N'A heart-shaped balloon with a picture of the King himself-Elvis Presley. This must-have for any Elvis fan has "Love Me Tender" written on it with a copy of Elvis''s signature.', 12.9900, N't16973p.jpg', N'16973p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (10, 2, N'I Can''t Get Enough of You Baby', N'When you just can''t get enough of someone, this Austin Powers style balloon says it all.', 12.9900, N't16974p.jpg', N'16974p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (11, 2, N'Picture Perfect Love Swing', N'A red heart-shaped balloon with a cute picture of two children kissing on a swing.', 12.9900, N't16980p.jpg', N'16980p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (12, 2, N'I Love You Roses', N'A white heart-shaped balloon has "I Love You" written on it and is beautifully decorated with two flowers, a small red heart in the middle, and miniature hearts all around.', 12.9900, N't214006p.jpg', N'214006p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (13, 2, N'I Love You Script', N'A romantic red heart-shaped balloon with "I Love You" in white. What more can you say?', 12.9900, N't214041p.jpg', N'214041p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (14, 2, N'Love Rose', N'A white heart-shaped balloon with a rose and the words "I Love You." Romantic and irresistible.', 12.9900, N't214168p.jpg', N'214168p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (15, 2, N'You''re So Special', N'Tell someone how special he or she is with this lovely heart-shaped balloon with a cute bear holding a flower.', 12.9900, N't215302p.jpg', N'215302p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (16, 2, N'I Love You Red Flourishes', N'A simple but romantic red heart-shaped balloon with "I Love You" in large script writing.', 12.9900, N't22849b.jpg', N'22849b.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (17, 2, N'I Love You Script', N'A simple, romantic red heart-shaped balloon with "I Love You" in small script writing.', 12.9900, N't45093.jpg', N'45093.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (18, 3, N'Love Cascade Hearts', N'A romantic red heart-shaped balloon with hearts and I "Love You."', 12.9900, N't68841b.jpg', N'68841b.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (19, 3, N'You''re So Special', N'Someone special in your life? Let them know by sending this "You''re So Special" balloon!', 12.9900, N't7004801.jpg', N'7004801.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (20, 3, N'Love Script', N'Romance is in the air with this red heart-shaped balloon. Perfect for the love of your life.', 12.9900, N't7008501.jpg', N'7008501.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (21, 3, N'Baby Hi Little Angel', N'Baby Hi Little Angel', 12.9900, N't115343p.jpg', N'115343p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (22, 3, N'I''m Younger Than You', N'Roses are red, violets are blue, but this balloon isn''t a romantic balloon at all. Have a laugh, and tease someone older.', 12.9900, N't16118p.jpg', N'16118p.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (23, 3, N'Birthday Balloon', N'Great Birthday Balloons. Available in pink or blue. One side says "Happy Birthday To You" and the other side says  "Birthday Girl" on the Pink Balloon and "Birthday Boy" on the Blue Balloon. Especially great for children''s parties.', 12.9900, N't26013.jpg', N'26013.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (24, 3, N'Birthday Star Balloon', N'Send a birthday message with this delightful star-shaped balloon and make someone''s day!', 12.9900, N't35732.jpg', N'35732.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (25, 4, N'Tweety Stars', N'A cute Tweety bird on a blue heart-shaped balloon with stars. Sylvester is in the background, plotting away as usual.', 12.9900, N't0276001.jpg', N'0276001.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (26, 4, N'You''re Special', N'An unusual heart-shaped balloon with the words "You''re special.".', 12.9900, N't0704901.jpg', N'0704901.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (27, 4, N'I''m Sorry (Simon Elvin) Balloon', N'The perfect way to say you''re sorry. Send a thought with this cute bear  balloon.', 12.9900, N't0707401.jpg', N'0707401.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (28, 4, N'World''s Greatest Mom', N'A lovely way to tell your Mom that she''s special. Surprise her with this lovely balloon on her doorstep.', 12.9900, N't114103p.jpg', N'114103p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (29, 5, N'Good Luck', N'Big day ahead? Wish someone "Good Luck" with this colorful balloon!', 12.9900, N't114118p.jpg', N'114118p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (30, 5, N'Big Congratulations Balloon', N'Does someone deserve a special pat on the back? This balloon is a perfect way to pass on the message', 12.9900, N't114208p.jpg', N'114208p.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (31, 5, N'You''re So Special', N'A purple balloon with the simple words "You''re so Special!" on it. Go on, let them know they are special.', 12.9900, N't16148p.jpg', N'16148p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (32, 5, N'Thinking of You', N'A round balloon just screaming out "Thinking of You!"; especially great if you are far away from someone you care for.', 12.9900, N't16151p.jpg', N'16151p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (33, 5, N'Welcome Back', N'A great way to say Welcome Back!', 12.9900, N't16558p.jpg', N'16558p.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (34, 5, N'Words of Thanks', N'A round balloon with lots and lots of Thank You''s written on it. You''re sure to get the message through with this grateful balloon.', 12.9900, N't16772p.jpg', N'16772p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (35, 5, N'Missed You''ll Be', N'If someone special is Going away, let this cute puppy balloon tell them they''ll be missed.', 12.9900, N't16809p.jpg', N'16809p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (36, 5, N'You''re Appreciated', N'A spotty balloon with the words "You''re Appreciated". I bet they''ll appreciate it too!', 12.9900, N't16988p.jpg', N'16988p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (37, 5, N'Thinking of You', N'Thinking of someone? Let them know with this thoughtful heart-shaped balloon with flowers in the background.', 12.9900, N't214046p.jpg', N'214046p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (38, 5, N'Get Well-Daisy Smiles', N'We all get sick sometimes and need something to cheer us up. Make the world brighter for someone with this Get Well Soon balloon.', 12.9900, N't21825b.jpg', N'21825b.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (39, 5, N'Toy Story', N'Woody and Buzz from Toy Story, on a round balloon.', 12.9900, N't0366101.jpg', N'0366101.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (40, 5, N'Rugrats Tommy & Chucky', N'If you are a Rugrats fan, you''ll be nuts about this purple Rugrats balloon featuring Chucky and Tommy. A definite Nickelodeon Toon favorite.', 12.9900, N't03944l.jpg', N'03944l.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (41, 5, N'Rugrats & Reptar Character', N'Rugrats balloon featuring Angelica, Chucky, Tommy, and Reptar.', 12.9900, N't03945L.jpg', N'03945L.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (42, 5, N'Tweety & Sylvester', N'A blue round balloon with the great cartoon pair: Tweety & Sylvester.', 12.9900, N't0510801.jpg', N'0510801.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (43, 5, N'Mickey Close-up', N'A close-up of Mickey Mouse on a blue heart-shaped balloon. Check out our close-up matching Minnie balloon.', 12.9900, N't0521201.jpg', N'0521201.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (44, 5, N'Minnie Close-up', N'A close-up of Minnie Mouse on a pink heart-shaped balloon. Check out our close-up matching Mickey balloon.', 12.9900, N't0522101.jpg', N'0522101.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (45, 5, N'Teletubbies Time', N'Time for Teletubbies balloon. Great gift for any kid.', 12.9900, N't0611401.jpg', N'0611401.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (46, 6, N'Barbie My Special Things', N'Barbie and her friends on a round balloon.', 12.9900, N't0661701.jpg', N'0661701.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (47, 6, N'Paddington Bear', N'Remember Paddington? A must-have for any Paddington Bear lover.', 12.9900, N't215017p.jpg', N'215017p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (48, 6, N'I Love You Snoopy', N'The one and only Snoopy hugging Charlie Brown to say "I Love You."', 12.9900, N't215402p.jpg', N'215402p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (49, 6, N'Pooh Adult', N'An adorable Winnie the Pooh balloon.', 12.9900, N't81947pl.jpg', N'81947pl.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (50, 6, N'Pokemon Character', N'A Pokemon balloon with a lot of mini pictures of the rest of the cast. Pokemon, Gotta catch ''em all!', 12.9900, N't83947.jpg', N'83947.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (51, 6, N'Pokemon Ash & Pikachu', N'A Pokemon balloon with Ash and Pikachu. Gotta catch ''em all!', 12.9900, N't83951.jpg', N'83951.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (52, 6, N'Smiley Kiss Yellow', N'The ever-famous Smiley Face balloon on the classic yellow background with three smooch kisses.', 12.9900, N't16862p.jpg', N'16862p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (53, 6, N'Smiley Face', N'A red heart-shaped balloon with a cartoon smiley face.', 12.9900, N't214154p.jpg', N'214154p.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (54, 6, N'Soccer Shape', N'A soccer-shaped balloon great for any soccer fan.', 12.9900, N't28734.jpg', N'28734.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (55, 6, N'Goal Ball', N'A round soccer balloon. Ideal for any sports fan, or an original way to celebrate an important Goal in that "oh so important" game.', 12.9900, N'ta1180401.jpg', N'a1180401.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (56, 6, N'Wedding Doves', N'A white heart-shaped balloon with wedding wishes and intricate designs of doves in silver.', 12.9900, N't1368601.jpg', N'1368601.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (57, 6, N'Crystal Rose Silver', N'A transparent heart-shaped balloon with silver roses. Perfect for a silver anniversary or a wedding with a silver theme.', 12.9900, N't38196.jpg', N'38196.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (58, 6, N'Crystal Rose Gold', N'A transparent heart-shaped balloon with Gold roses. Perfect for a Golden anniversary or a wedding with a Gold theme.', 12.9900, N't38199.jpg', N'38199.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (59, 1, N'Crystal Rose Red', N'A transparent heart-shaped balloon with red roses. Perfect for an anniversary or a wedding with a red theme.', 12.9900, N't38202.jpg', N'38202.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (60, 1, N'Crystal Etched Hearts', N'A transparent heart-shaped balloon with silver hearts. Perfect for a silver anniversary or a wedding with a silver theme.', 12.9900, N't42014.jpg', N'42014.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (61, 1, N'Crystal Love Doves Silver', N'A transparent heart-shaped balloon with two love doves in silver.', 12.9900, N't42080.jpg', N'42080.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (62, 1, N'Crystal Etched Hearts', N'A transparent heart-shaped balloon with red hearts.', 12.9900, N't42139.jpg', N'42139.jpg', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront]) VALUES (63, 1, N'Titanic', N'The White Star Line faced an increasing challenge from its main rivals Cunard, which had recently launched the Lusitania and the Mauretania—the fastest passenger ships then in service—and the German lines Hamburg America and Norddeutscher Lloyd. Ismay preferred to compete on size rather than speed and proposed to commission a new class of liners that would be larger than anything that had gone before as well as being the last word in comfort and luxury. The company sought an upgrade in their fleet primarily in response to the Cunard giants but also to replace their oldest pair of passenger ships still in service, being the SS Teutonic of 1889 and SS Majestic of 1890.', 15.0000, N'300px-RMS_Titanic_3.jpg', N'1024px-RMS_Titanic_3.jpg', 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderID_ToOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderID_ToOrder]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductID_ToProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_ProductID_ToProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ToTable] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ToTable]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_ToProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_ToProduct]
GO
/****** Object:  StoredProcedure [dbo].[Category_Add]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Add] @CategoryID INT OUTPUT
	,@Name NVARCHAR(50)
	,@Description NVARCHAR(1000)
AS
INSERT INTO [Category] (
	[Name]
	,[Description]
	)
VALUES (
	@Name
	,@Description
	)

SET @CategoryID = @@IDENTITY

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Category_All]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_All]
AS
SET NOCOUNT ON

SELECT CategoryID
	,Name
	,Description
FROM [dbo].Category
GO
/****** Object:  StoredProcedure [dbo].[Category_Delete]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Delete] @CategoryID INT
AS
DELETE [Category]
WHERE [CategoryID] = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[Category_Single]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Single] @CategoryID INT
AS
SET NOCOUNT ON

SELECT CategoryID
	,Name
	,Description
FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[Category_Update]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Update] @CategoryID INT
	,@Name NVARCHAR(50)
	,@Description NVARCHAR(1000)
AS
UPDATE [Category]
SET [Name] = @Name
	,[Description] = @Description
WHERE [CategoryID] = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[Order_ByDate]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_ByDate]
	@StartDate smalldatetime,
	@EndDate smalldatetime
AS
	SELECT * FROM [Order]
	WHERE DateCreated BETWEEN @StartDate AND @EndDate
	ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[Order_ByRecent]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_ByRecent]
	@Count int
AS
	SET ROWCOUNT @Count
	SELECT * FROM [Order] ORDER BY DateCreated DESC
	SET ROWCOUNT 0
GO
/****** Object:  StoredProcedure [dbo].[Order_ByStatus]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_ByStatus]
@Status int
AS
SELECT * FROM [Order] WHERE [Status]=@Status
GO
/****** Object:  StoredProcedure [dbo].[Order_Create]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_Create]
	@CartID varchar(36),
	@Username nvarchar(256),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(256),
	@Phone nvarchar(50),
	@ShippingAddress nvarchar(500)
AS
BEGIN
	DECLARE @OrderID int
	INSERT INTO [Order] (DateCreated, Username, FirstName, LastName, Email, Phone, ShippingAddress, [Status])
	VALUES (GETDATE(), @Username, @FirstName, @LastName, @Email, @Phone, @ShippingAddress, 0)
	
	SET @OrderID = @@IDENTITY
	
	INSERT INTO OrderDetail (OrderID, ProductID, ProductName, Quantity, UnitCost) 
	SELECT @OrderID, Product.ProductID, Product.Name, ShoppingCart.Quantity, Product.Price
	FROM Product JOIN ShoppingCart
	ON Product.ProductID = ShoppingCart.ProductID
	WHERE ShoppingCart.CartID = @CartID

	DELETE FROM ShoppingCart WHERE CartID=@CartID
	SELECT @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[Order_Details]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_Details]
	@OrderID int
AS
	SELECT OrderID, ProductID, ProductName, Quantity, UnitCost, Subtotal
	FROM OrderDetail
	WHERE OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[Order_Single]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_Single]
	@OrderID int
AS
	SELECT OrderID, (
		SELECT SUM(Subtotal) 
		FROM OrderDetail 
		WHERE OrderID=@OrderID
	) AS TotalAmount, DateCreated, DateShipped, Comments, [Status], Username, FirstName, LastName, Phone, Email ShippingAddress
	FROM [Order]
	WHERE OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[Order_Update]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_Update]
	@OrderID int,
	@DateCreated smalldatetime,
	@DateShipped smalldatetime,
	@Comments nvarchar(500),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(256),
	@Phone nvarchar(50),
	@ShippingAddress nvarchar(500),
	@Status int
AS
	UPDATE [Order]
	SET
		DateCreated =@DateCreated,
		DateShipped=@DateShipped,
		Comments=@Comments,
		FirstName=@FirstName,
		LastName=@LastName,
		Email=@Email,
		Phone=@Phone,
		ShippingAddress=@ShippingAddress,
		[Status]=@Status
	WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[Order_UpdateStatus]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_UpdateStatus]
	@OrderID int,
	@Status int
AS
	UPDATE [Order]
	SET [Status]=@Status
	WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[Product_Add]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Add]
	@ProductID int output,
	@CategoryID int,
	@Name nvarchar(50),
	@Description nvarchar(4000),
	@Price money,
	@Thumbnail nvarchar(50),
	@Image nvarchar(50),
	@PromoFront bit
AS
INSERT INTO [Product]
(
	[CategoryID],
	[Name],
	[Description],
	[Price],
	[Thumbnail],
	[Image],
	[PromoFront]
)
VALUES
(
	@CategoryID,
	@Name,
	@Description,
	@Price,
	@Thumbnail,
	@Image,
	@PromoFront
)
SET @ProductID = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Delete]
	@ProductID INT
AS
	DELETE ShoppingCart WHERE ProductID = @ProductID
	DELETE Product WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[Product_InCategory]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_InCategory] (
	@CategoryID INT
	,@DescriptionLength INT
	,@PageNumber INT
	,@ProductsPerPage INT
	)
AS
SET NOCOUNT ON

DECLARE @Products TABLE (
	RowNumber INT
	,ProductID INT
	,Name NVARCHAR(50)
	,Description NVARCHAR(MAX)
	,Price MONEY
	,Thumbnail NVARCHAR(50)
	,IMAGE NVARCHAR(50)
	,PromoFront BIT
	)

INSERT INTO @Products
SELECT ROW_NUMBER() OVER (
		ORDER BY ProductID
		)
	,ProductID
	,Name
	,CASE 
		WHEN LEN(Description) <= @DescriptionLength
			THEN Description
		ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...'
		END AS Description
	,Price
	,Thumbnail
	,IMAGE
	,PromoFront
FROM Product
WHERE CategoryID = @CategoryID

SELECT COUNT(ProductID)
FROM @Products

SELECT *
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
	AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[Product_OnPromo]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_OnPromo] @DescriptionLength INT
	,@PageNumber INT
	,@ProductsPerPage INT
AS
SET NOCOUNT ON

DECLARE @Products TABLE (
	RowNumber INT
	,ProductID INT
	,CategoryID INT
	,Name NVARCHAR(50)
	,Description NVARCHAR(4000)
	,Price MONEY
	,Thumbnail NVARCHAR(50)
	,IMAGE NVARCHAR(50)
	,PromoFront BIT
	)

INSERT INTO @Products
SELECT ROW_NUMBER() OVER (
		ORDER BY Product.ProductID
		)
	,ProductID
	,CategoryID
	,Name
	,CASE 
		WHEN len(Description) <= @DescriptionLength
			THEN Description
		ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...'
		END AS Description
	,Price
	,Thumbnail
	,IMAGE
	,PromoFront
FROM Product
WHERE PromoFront = 1

SELECT count(ProductID)
FROM @Products

SELECT ProductID
	,CategoryID
	,Name
	,Description
	,Price
	,Thumbnail
	,IMAGE
	,PromoFront
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
	AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[Product_Paging]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Paging]
	@PageNumber INT,
	@ProductsPerPage INT
AS
	SET NOCOUNT ON
	DECLARE @Products TABLE
	(
		RowNumber INT,
		ProductID INT,
		Name NVARCHAR(50),
		Price MONEY,
		Thumbnail NVARCHAR(50),
		PromoFront bit
	)
	INSERT INTO @Products
	SELECT ROW_NUMBER() OVER (ORDER BY ProductID DESC), ProductID, Name, Price, Thumbnail, PromoFront
	FROM Product

	SELECT COUNT(ProductID) 
	FROM @Products

	SELECT * 
	FROM @Products
	WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[Product_Search]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Search] @Word NVARCHAR(50)
	,@DescriptionLength INT
	,@PageNumber INT
	,@ProductsPerPage INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @Products TABLE (
		RowNumber INT
		,ProductID INT
		,Name NVARCHAR(50)
		,Description NVARCHAR(MAX)
		,Price MONEY
		,Thumbnail NVARCHAR(50)
		)

	INSERT INTO @Products
	SELECT ROW_NUMBER() OVER (
			ORDER BY ProductID
			)
		,ProductID
		,Name
		,CASE 
			WHEN LEN(Description) <= @DescriptionLength
				THEN Description
			ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...'
			END AS Description
		,Price
		,Thumbnail
	FROM Product
	WHERE Name LIKE N'%' + @Word + '%'

	SELECT count(ProductID)
	FROM @Products

	SELECT *
	FROM @Products
	WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
		AND RowNumber <= @PageNumber * @ProductsPerPage
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Single]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Single] @ProductID INT
AS
SET NOCOUNT ON

SELECT ProductID
	,CategoryID
	,Name
	,Description
	,Price
	,Thumbnail
	,IMAGE
	,PromoFront
FROM Product
WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Update]
	@ProductID int,
	@CategoryID int,
	@Name nvarchar(50),
	@Description nvarchar(4000),
	@Price money,
	@Thumbnail nvarchar(50),
	@Image nvarchar(50),
	@PromoFront bit
AS
	UPDATE [Product] 
	SET
		[CategoryID] = @CategoryID,
		[Name] = @Name,
		[Description] = @Description,
		[Price] = @Price,
		[Thumbnail] = @Thumbnail,
		[Image] = @Image,
		[PromoFront] = @PromoFront
	WHERE [ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[Product_UpdatePromo]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_UpdatePromo]
	@ProductID int,
	@PromoFront bit
AS
	UPDATE [Product] 
	SET
		[PromoFront] = @PromoFront
	WHERE [ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_Add]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_Add]
	@CartID varchar(36),
	@ProductID int
AS
BEGIN
	IF EXISTS (SELECT CartID FROM ShoppingCart WHERE ProductID = @ProductID AND CartID=@CartID)
		UPDATE ShoppingCart
		SET Quantity = Quantity + 1
		WHERE ProductID=@ProductID AND CartID=@CartID
	ELSE
		IF EXISTS (SELECT Name FROM Product WHERE ProductID=@ProductID)
		INSERT INTO ShoppingCart (CartID, ProductID, Quantity, DateAdded)
		VALUES (@CartID, @ProductID, 1, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_CountOldCarts]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_CountOldCarts]
	@Days smallint
AS
BEGIN
	SELECT COUNT(CartID) FROM ShoppingCart
	WHERE CartID IN
	(
		SELECT CartID FROM ShoppingCart
		GROUP BY CartID
		HAVING MIN(DATEDIFF(dd, DateAdded, GETDATE()))>=@Days
	)
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_DeleteOldCarts]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_DeleteOldCarts]
	@Days smallint
AS
BEGIN
	DELETE FROM ShoppingCart
	WHERE CartID IN
	(
		SELECT CartID FROM ShoppingCart
		GROUP BY CartID
		HAVING MIN(DATEDIFF(dd, DateAdded, GETDATE()))>=@Days
	)
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_Items]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_Items]
	@CartID varchar(36)
AS
BEGIN
	SELECT Product.ProductID, Product.Name, Product.Price, ShoppingCart.Quantity, Product.Price * ShoppingCart.Quantity AS Subtotal
	FROM ShoppingCart INNER JOIN Product
	ON ShoppingCart.ProductID = Product.ProductID
	WHERE ShoppingCart.CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_Remove]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_Remove]
	@CartID varchar(36),
	@ProductID int
AS
BEGIN
	DELETE FROM ShoppingCart
	WHERE ProductID = @ProductID AND CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_TotalAmount]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_TotalAmount]
	@CartID varchar(36)
AS
	SELECT ISNULL(SUM(Product.Price * ShoppingCart.Quantity), 0)
	FROM ShoppingCart INNER JOIN Product
	ON ShoppingCart.ProductID = Product.ProductID
	WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCart_Update]    Script Date: 11/4/2019 5:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCart_Update]
	@CartID varchar(36),
	@ProductID int,
	@Quantity int
AS
BEGIN
	IF @Quantity <= 0
		EXEC ShoppingCart_Remove @CartID, @ProductID
	ELSE
		UPDATE ShoppingCart
		SET Quantity = @Quantity, DateAdded = GETDATE()
		WHERE ProductID = @ProductID AND CartID = @CartID
END
GO
