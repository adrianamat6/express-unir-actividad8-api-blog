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
        
        // 2. Devolvemos el ID generado fusionado con los datos
        res.status(201).json({
            message: 'Autor creado exitosamente',
            id: insertId,
            ...req.body
        });
    } catch (error) {
        // Atrapamos específicamente el error de duplicado de MySQL
        if (error.code === 'ER_DUP_ENTRY') {
            return res.status(409).json({ 
                message: 'Ya existe un autor registrado con este email.' 
            });
        }

        // Si es otro tipo de error, sí devolvemos el 500
        console.error('Error al crear autor:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = { getAllAuthors, createAuthor };