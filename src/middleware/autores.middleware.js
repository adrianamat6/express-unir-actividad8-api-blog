const AutoresModel = require('../models/autores.model');

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

        // GUARDAMOS EN REQ: Evitamos la "Doble Consulta" en los controladores
        req.autor = autor; 
        
        next(); 
    } catch (error) {
        console.error('Error en el middleware checkAuthorExists:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = { checkAuthorExists };