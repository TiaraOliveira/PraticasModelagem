CREATE TABLE "public.Client" (
	"id" serial NOT NULL,
	"fullName" varchar(100) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT(100) NOT NULL UNIQUE,
	"password" TEXT(10) NOT NULL,
	CONSTRAINT "Client_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"price" int(255) NOT NULL DEFAULT '0',
	"idCategoria" int(255) NOT NULL,
	"image" TEXT NOT NULL,
	"stock" int NOT NULL DEFAULT '0',
	"description" TEXT,
	"idSize" int NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" bigint NOT NULL UNIQUE,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adress" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"customersId" int NOT NULL,
	"number" int NOT NULL,
	"complement" TEXT,
	"postalCode" TEXT NOT NULL,
	"idCity" int NOT NULL,
	CONSTRAINT "adress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"idState" varchar(255) NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.image" (
	"id" serial NOT NULL,
	"image" TEXT NOT NULL,
	"idProduct" TEXT NOT NULL,
	CONSTRAINT "image_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Order" (
	"id" serial NOT NULL,
	"idClient" serial NOT NULL,
	"date" DATE NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'criada',
	CONSTRAINT "Order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.items" (
	"id" serial NOT NULL,
	"idOrders" serial NOT NULL,
	"idProduct" serial NOT NULL,
	"quantity" int NOT NULL DEFAULT '0',
	CONSTRAINT "items_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.size" (
	"id" serial NOT NULL,
	"name" char NOT NULL,
	CONSTRAINT "size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("idCategoria") REFERENCES "category"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk1" FOREIGN KEY ("idSize") REFERENCES "size"("id");


ALTER TABLE "adress" ADD CONSTRAINT "adress_fk0" FOREIGN KEY ("customersId") REFERENCES "Client"("id");
ALTER TABLE "adress" ADD CONSTRAINT "adress_fk1" FOREIGN KEY ("idCity") REFERENCES "cities"("id");


ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("idState") REFERENCES "states"("id");

ALTER TABLE "image" ADD CONSTRAINT "image_fk0" FOREIGN KEY ("idProduct") REFERENCES "Products"("id");

ALTER TABLE "Order" ADD CONSTRAINT "Order_fk0" FOREIGN KEY ("idClient") REFERENCES "Client"("id");

ALTER TABLE "items" ADD CONSTRAINT "items_fk0" FOREIGN KEY ("idOrders") REFERENCES "Order"("id");
ALTER TABLE "items" ADD CONSTRAINT "items_fk1" FOREIGN KEY ("idProduct") REFERENCES "Products"("id");
