const AutoresModel = require('../models/autores.model');

const checkAuthorData = (req, res, next) => {
    const { nombre, email } = req.body;
    if (!nombre || !email) {
        return res.status(400).json({ message: "Los campos 'nombre' y 'email' son obligatorios." });
    }
    next(); 
};

const checkPostData = (req, res, next) => {
    const { titulo, descripcion, categoria, autor_id } = req.body;
    if (!titulo || !descripcion || !categoria || !autor_id) {
        return res.status(400).json({ message: "Los campos 'titulo', 'descripcion', 'categoria' y 'autor_id' son obligatorios." });
    }
    next();
};

const checkAuthorExists = async (req, res, next) => {
    const autorId = req.params.autorId || req.body.autor_id;

    if (!autorId || isNaN(autorId)) {
        return res.status(400).json({ message: 'El ID del autor no es válido.' });
    }

    try {
        const autor = await AutoresModel.getById(autorId);
        if (!autor) {
            return res.status(404).json({ message: 'No existe ningún autor con ese ID.' });
        }

        // Lo guardamos en 'req' por si el controlador lo necesitara después
        req.autor = autor; 
        
        next(); 
    } catch (error) {
        console.error('Error en el middleware checkAuthorExists:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = { checkAuthorData, checkPostData, checkAuthorExists };