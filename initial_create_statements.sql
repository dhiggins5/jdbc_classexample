CREATE TABLE IF NOT EXISTS "recipe" (
	"recipe_id" serial NOT NULL UNIQUE,
	"name" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"category" varchar(255) NOT NULL,
	"recipe_instructions" varchar(255) NOT NULL,
	"create_date" date NOT NULL,
	"ingredient_id" bigint NOT NULL,
	PRIMARY KEY ("recipe_id")
);

CREATE TABLE IF NOT EXISTS "ingredients" (
	"ingredient_id" serial NOT NULL UNIQUE,
	"name" varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"num_instock" bigint NOT NULL,
	"reorder" boolean NOT NULL,
	"last_updated" timestamp without time zone NOT NULL,
	PRIMARY KEY ("ingredient_id")
);

CREATE TABLE IF NOT EXISTS "batches" (
	"batch_number" serial NOT NULL UNIQUE,
	"recipe_id" bigint NOT NULL,
	"batch_size" bigint NOT NULL,
	"date_made" date NOT NULL,
	"date_expired" date NOT NULL,
	PRIMARY KEY ("batch_number")
);

CREATE TABLE IF NOT EXISTS "customer" (
	"customer_id" serial NOT NULL UNIQUE,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"phone_num" varchar(255) NOT NULL,
	"reward_points" bigint NOT NULL,
	PRIMARY KEY ("customer_id")
);

CREATE TABLE IF NOT EXISTS "transactions" (
	"transaction_id" serial NOT NULL UNIQUE,
	"customer_id" bigint,
	"recipe_id" bigint NOT NULL,
	"date" date NOT NULL,
	"total" double precision NOT NULL,
	"payment_method" varchar(255) NOT NULL,
	"quantity" bigint NOT NULL,
	"price" bigint NOT NULL,
	PRIMARY KEY ("transaction_id")
);

CREATE TABLE IF NOT EXISTS "supplier" (
	"supplier_id" serial NOT NULL UNIQUE,
	"name" varchar(255) NOT NULL,
	"phone_num" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	"city" varchar(255) NOT NULL,
	"country" varchar(255) NOT NULL,
	"zipcode" bigint NOT NULL,
	PRIMARY KEY ("supplier_id")
);

CREATE TABLE IF NOT EXISTS "supplier_inventory" (
	"id" serial NOT NULL UNIQUE,
	"supplier_id" bigint NOT NULL,
	"ingredient_id" bigint NOT NULL,
	"price" bigint NOT NULL,
	"quantity_available" bigint NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "supplies" (
	"supply_id" serial NOT NULL UNIQUE,
	"name" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"category" varchar(255) NOT NULL,
	"supplier_id" bigint NOT NULL,
	PRIMARY KEY ("supply_id")
);

CREATE TABLE IF NOT EXISTS "order" (
	"order_id" serial NOT NULL UNIQUE,
	"transaction_id" bigint NOT NULL,
	"num_of_items" bigint NOT NULL,
	"type" varchar(255) NOT NULL,
	PRIMARY KEY ("order_id")
);

ALTER TABLE "recipe" ADD CONSTRAINT "recipe_fk6" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredient_id");

ALTER TABLE "batches" ADD CONSTRAINT "batches_fk1" FOREIGN KEY ("recipe_id") REFERENCES "recipe"("recipe_id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk1" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk2" FOREIGN KEY ("recipe_id") REFERENCES "recipe"("recipe_id");

ALTER TABLE "supplier_inventory" ADD CONSTRAINT "supplier_inventory_fk1" FOREIGN KEY ("supplier_id") REFERENCES "supplier"("supplier_id");

ALTER TABLE "supplier_inventory" ADD CONSTRAINT "supplier_inventory_fk2" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredient_id");
ALTER TABLE "supplies" ADD CONSTRAINT "supplies_fk4" FOREIGN KEY ("supplier_id") REFERENCES "supplier"("supplier_id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("transaction_id") REFERENCES "transactions"("transaction_id");