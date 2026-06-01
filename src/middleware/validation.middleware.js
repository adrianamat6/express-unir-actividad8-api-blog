const validateSchema = (schema) => {
    return async (req, res, next) => {
        try { 
            // stripUnknown: true limpia todo lo que el cliente mande y no esté en tu esquema
            const data = await schema.validate(req.body, { abortEarly: false, stripUnknown: true });
            req.body = data; 
            next();
        } catch (error) {
            res.status(400).json({ message: 'Error de validación', errors: error.errors });
        }
    }
}

module.exports = { validateSchema };