USE [BDCHAT]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 24/01/2023 13:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mensaje] [varchar](max) NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/01/2023 13:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [int] NULL,
	[clave] [varchar](50) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_Chat]    Script Date: 24/01/2023 13:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_guardar_Chat]
@mensaje varchar(MAX),
@idusuario int
as
INSERT INTO chat (mensaje,idusuario) 
values (@mensaje,@idusuario)
GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_usuario]    Script Date: 24/01/2023 13:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_guardar_usuario]
@cedula int,
@clave int
as
INSERT INTO usuario (cedula,clave) 
values (@cedula,@clave)
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_Chats]    Script Date: 24/01/2023 13:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_lista_Chats]
as
select c.id,u.cedula,c.mensaje
from CHAT c,usuario u 
where  u.id= c.idUsuario
order by c.id asc
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_usuario]    Script Date: 24/01/2023 13:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_lista_usuario]
as
begin
	select cedula,clave
	from usuario
end


GO