import mysql from 'mysql';
import express from 'express';
import cors from 'cors';

const app = express();
app.use(cors());
app.use(express.json());

 // Configuración de conexión
const db = mysql.createConnection({
    host: 'localhost',  // Servidor de la base de datos
    user: 'root',       // Usuario de MySQL
    password: '',        // Contraseña (dejar vacío si no tiene)
    database: 'boletin' // Nombre de la base de datos
});

 // Conectar a la base de datos
db.connect(err => {
	if (err) {
	console.error('Error de conexión a MySQL:', err);
	} else {
	console.log('Conectado a MySQL ✅');
	}
})

 /////// ENDPOINT POST - Registrar datos EJEMPLO-
app.post('/boletin/registrarse', (req, res) => {
  const {nombre,apellido,dni } = req.body;  // ACÁ SE EXTRAEN LOS VALORES DEL CUERPO DEL FORMULARIO.
  const enviar = 'INSERT INTO boletin (nombre,apellido,dni) VALUES (?,?,?)';
  db.query(enviar,[nombre,apellido,dni], (err,results) => {
    if (err){
      console.log (`error al registrarse`);
      res.status(500).json ( {error: `errror al ingresar`});
    }else{
      res.status(201).json({message: `usuario registrado`});
   }
  });
});

/////// ENDPOINT POST - Registrar datos EJEMPLO-
app.post('/boletin/informes', (req, res) => {
  const {informe_1,informe_2,informe_3,nota_final } = req.body;  // ACÁ SE EXTRAEN LOS VALORES DEL CUERPO DEL FORMULARIO.
  const enviar = 'INSERT INTO boletin (informe_1,informe_2,informe_3,nota_final) VALUES (?,?,?,?)';
  db.query(enviar,[informe_1,informe_2,informe_3,nota_final], (err,results) => {
    if (err){
      console.log (`error al registrarse`);
      res.status(500).json ( {error: `errror al ingresar`});
    }else{
      res.status(201).json({message: `usario registrado`});
   }
  });
});

 /////// ENDPOINT POST - Registrar datos EJEMPLO-
app.post('/boletin/materias', (req, res) => {
  const {software,hardware,programacion,redes,asistencia,matemáticas,marcojurídico, ingles,nombre } = req.body;  // ACÁ SE EXTRAEN LOS VALORES DEL CUERPO DEL FORMULARIO.
  const enviar = 'INSERT INTO boletin (software,hardware,programacion,redes,asistencia,matemáticas,marcojurídico, ingles,nombre) VALUES (?,?,?,?,?,?,?,?,?)';
  db.query(enviar,[software,hardware,programacion,redes,asistencia,matemáticas,marcojurídico, ingles,nombre], (err,results) => {
    if (err){
      console.log (`error al insertar el ticket`);
      res.status(500).json ( {error: `errror al mandar`});
    }else{
      res.status(201).json({message: `tickets creado`});
   }
  });
});

app.listen(3000, () => {
  console.log(`Servidor funcionando`);
});
app.get('/boletin', (req, res) => {
  const soli = 'SELECT * FROM boletin'
  db.query(soli, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error al obtener los clientes');
    } else {
      res.json(results);
    }
  });
});


