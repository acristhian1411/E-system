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
