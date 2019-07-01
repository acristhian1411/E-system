BEGIN
--restar stock
    UPDATE stocks
        SET cantidad = cantidad - (SELECT traslado_detalles.cantidad
        FROM traslado_detalles  WHERE traslado_detalles.id=(SELECT max(id) FROM traslado_detalles))
        WHERE(sucursal_id = (SELECT traslados.sucursal_origen
        FROM traslados WHERE traslados.id =( SELECT max(id) FROM traslados))) AND producto_id = (SELECT traslado_detalles.producto_id
        FROM traslado_detalles WHERE traslado_detalles.id=(SELECT max(id) FROM traslado_detalles));

--sumar stock
    UPDATE stocks
        SET cantidad = cantidad + (SELECT traslado_detalles.cantidad
        FROM traslado_detalles  WHERE traslado_detalles.id=(SELECT max(id) FROM traslado_detalles))
        WHERE(sucursal_id = (SELECT traslados.sucursal_destino
        FROM traslados WHERE traslados.id =( SELECT max(id) FROM traslados))) AND producto_id = (SELECT traslado_detalles.producto_id
        FROM traslado_detalles WHERE traslado_detalles.id=(SELECT max(id) FROM traslado_detalles));

RETURN NEW;
 END;



 --restar stock
     UPDATE stocks
         SET cantidad = cantidad - (SELECT traslado_detalles.cantidad
 					FROM traslado_detalles  WHERE traslado_detalles.traslado_id =
 									(SELECT max(id) FROM traslados)
 				)
         WHERE(sucursal_id = (SELECT traslados.sucursal_origen
 				FROM traslados WHERE( traslados.id = (SELECT max(id) FROM traslados)
 							)
 				)
 		)
         AND producto_id = (SELECT traslado_detalles.producto_id
 				FROM traslado_detalles WHERE traslado_detalles.id=(SELECT max(id) FROM traslado_detalles));

 --sumar stock
     UPDATE stocks
         SET cantidad = cantidad + (SELECT traslado_detalles.cantidad
 					FROM traslado_detalles  WHERE traslado_detalles.traslado_id =
 					(SELECT max(id) FROM traslados)
 					)
         WHERE(sucursal_id = (SELECT traslados.sucursal_destino
 				FROM traslados WHERE traslados.id =( SELECT max(id) FROM traslados)
 				)
 		)
 	AND producto_id = (SELECT traslado_detalles.producto_id
 				FROM traslado_detalles WHERE traslado_detalles.traslado_id=(SELECT max(id) FROM traslados));


--otra funcion que no funciona

        DECLARE v_cursor record;

        BEGIN

           FOR v_cursor IN
                SELECT traslado_detalles.cantidad, traslado_detalles.producto_id, traslados.sucursal_origen, traslados.sucursal_destino
                FROM traslado_detalles, traslados  WHERE traslado_detalles.id= NEW.id
           LOOP
               RAISE NOTICE 'Changes for %', v_cursor;
        -- restar stock
               UPDATE stocks
                   SET cantidad = cantidad - v_cursor.cantidad
                 WHERE stocks.producto_id = v_cursor.producto_id
                   AND stocks.sucursal_id = v_cursor.sucursal_origen;
        -- sumar stock
               UPDATE stocks
                   SET cantidad = cantidad - v_cursor.cantidad
                 WHERE stocks.producto_id = v_cursor.producto_id
                   AND stocks.sucursal_id = v_cursor.sucursal_destino;
           END LOOP;
        RETURN NEW;
        END;
