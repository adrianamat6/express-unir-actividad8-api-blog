const AutoresModel = require('../models/autores.model.js');

const getAllAuthors = async (req, res) => {
    try {
        const autores = await AutoresModel.getAll();
        res.json(autores);
    } catch (error) {
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

const createAuthor = async (req, res) => {
    try {
        // 1. Insertamos el autor y obtenemos el ID generado
        const insertId = await AutoresModel.create(req.body);
        
        // 2. Devolvemos el ID generado fusionado con los datos que ya teníamos en req.body
        res.status(201).json({
            message: 'Autor creado exitosamente',
            id: insertId,
            ...req.body
        });
    } catch (error) {
        console.error('Error al crear autor:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = { getAllAuthors, createAuthor };