
/*
linea de comando en terminal para sacar backup de base de datos
pg_dump esystem_dev > backup.sql
*/


/*
pg_dump dbname > outfile

 Script para poner valores por defecto
*/
ALTER TABLE public.categories
  ALTER COLUMN category_active SET DEFAULT true;
ALTER TABLE public.marcas
  ALTER COLUMN marca_active SET DEFAULT true;
ALTER TABLE public.productos
  ALTER COLUMN prod_active SET DEFAULT true;
ALTER TABLE public.providers
  ALTER COLUMN prov_active SET DEFAULT true;
ALTER TABLE public.sub_categories
  ALTER COLUMN subcat_active SET DEFAULT true;
ALTER TABLE public.sucursal
ALTER COLUMN suc_activo SET DEFAULT true;
ALTER TABLE public.compra_detalles
   ALTER COLUMN descuento SET DEFAULT 0;
   ALTER TABLE public.compras
      ALTER COLUMN activo SET DEFAULT true;

  CREATE UNIQUE INDEX index_unique
    ON public.stocks
    USING btree
    (producto_id, sucursal_id);

/*
 Funcion para insertar productos en tabla stock
*/
CREATE FUNCTION public.tr_produc_sucursal() RETURNS trigger AS
$BODY$
BEGIN
IF TG_OP = 'INSERT' THEN
   INSERT INTO stocks (producto_id, sucursal_id, cantidad, created_at, updated_at)
   VALUES (NEW.id, 1, 0, NOW(), NOW());
   INSERT INTO stocks (producto_id, sucursal_id, cantidad, created_at, updated_at)
   VALUES (NEW.id, 2, 0, NOW(), NOW());
   INSERT INTO stocks (producto_id, sucursal_id, cantidad, created_at, updated_at)
   VALUES (NEW.id, 3, 0, NOW(), NOW());
END IF;
return NEW;
END;$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;
ALTER FUNCTION public.tr_produc_sucursal()
 OWNER TO usuario;


/*
 Trigger asignado a tabla productos
*/
CREATE TRIGGER tg_prod_sucursal AFTER INSERT
  ON public.productos FOR EACH ROW
  EXECUTE PROCEDURE public.tr_produc_sucursal();

  /*
   Trigger para actualizar cantidad de productos
  */
  BEGIN
      IF EXISTS(SELECT * FROM inserted
            LEFT OUTER JOIN deleted
            ON inserted.NUMBER_STOCKS = deleted.NUMBER_STOCKS
            WHERE deleted.NUMBER_STOCKS IS NULL)
      UPDATE STOCKS
      SET QUANTITY = QUANTITY - NEW.QUANTITY
      WHERE ID = New.ID;
  END

  /*
   Trigger para actualizar cantidad de productos
  */
  BEGIN
    UPDATE s
        SET QUANTITY = QUANTITY - i.insert_quantity
        FROM STOCKS s JOIN
             (SELECT i.stock_id, SUM(i.quantity) as insert_quantity
              FROM inserted i
              GROUP BY i.stock_id
             ) i
             ON s.ID = i.ID;
  END;

--filter ventas
  SELECT venta.* FROM venta WHERE(venta.id = (
  SELECT venta_detalles.venta_id FROM venta_detalles WHERE(venta_detalles.producto_id = 5) LIMIT 1));

-- trigger
DECLARE cursorData refcursor;
    v_item_cd varchar;
    v_quantity numeric;

begin

open cursorData FOR
select A.item_cd, A.quantity from trx_medical_resep B
inner join trx_resep_data A on A.medical_resep_seqno = B.medical_resep_seqno
where B.medical_resep_seqno = noresep;
fetch next from cursorData into v_item_cd,v_quantity;
while (found)
loop
    update inv_pos_item set quantity = quantity - v_quantity
    where item_cd = v_item_cd and pos_cd = p_post_cd;
end loop;
close cursorData;

END
