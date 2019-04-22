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




--ejemplo trigger
DECLARE
trasl  CURSOR
FOR select traslados.id, traslados.sucursal_origen, traslados.sucursal_destino
FROM traslados ORDER BY traslados.created_at LIMIT $1;
detalles SCROLL CURSOR
FOR select traslado_detalles.traslado_id, traslado_detalles.producto_id, traslado_detalles.cantidad
FROM traslado_detalles WHERE traslado_detalles.traslado_id = NEW.id;
r1 RECORD;
BEGIN

OPEN detalles ;

LOOP

    FETCH detalles INTO r1;
    EXIT WHEN NOT FOUND;

                UPDATE stocks
                SET cantidad = cantidad + detalles.cantidad
                WHERE producto_id = detalles.producto_id AND sucursal_id = trasl.sucursal_destino;

                UPDATE stocks
                SET cantidad = cantidad - detalles.cantidad
                WHERE producto_id = detalles.producto_id AND sucursal_id = trasl.sucursal_origen;

                MOVE BACKWARD 1 FROM detalles;


END LOOP;

CLOSE detalles;
RETURN NEW;
END;
