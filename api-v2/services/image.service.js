const sharp = require('sharp');
const path = require('path');
const fs = require('fs').promises;

/**
 * Service de traitement d'images
 * Gère le redimensionnement et la conversion en WebP
 */

const VARIANTS = {
    thumbnail: { width: 150, quality: 70 },
    medium: { width: 400, quality: 80 },
    large: { width: 800, quality: 80 }
};

/**
 * Traite une image uploadée et génère les variants
 * @param {Buffer} buffer - Buffer de l'image originale
 * @param {string} filename - Nom de fichier de base (sans extension)
 * @param {string} outputDir - Dossier de destination
 * @returns {Promise<Object>} Chemins des fichiers générés
 */
async function processImage(buffer, filename, outputDir) {
    try {
        // Vérifier si le dossier existe, sinon le créer
        await fs.mkdir(outputDir, { recursive: true });

        const results = {};
        const timestamp = Date.now();
        const cleanFilename = filename.replace(/[^a-z0-9]/gi, '_').toLowerCase();

        // 1. Sauvegarder l'original (converti en WebP pour uniformité)
        const originalName = `${cleanFilename}_${timestamp}_original.webp`;
        await sharp(buffer)
            .webp({ quality: 90 })
            .toFile(path.join(outputDir, originalName));
        results.original = originalName;

        // 2. Générer les variants
        for (const [key, config] of Object.entries(VARIANTS)) {
            const variantName = `${cleanFilename}_${timestamp}_${key}.webp`;
            await sharp(buffer)
                .resize(config.width, null, { // Largeur fixe, hauteur auto
                    withoutEnlargement: true,
                    fit: 'inside'
                })
                .webp({ quality: config.quality })
                .toFile(path.join(outputDir, variantName));

            results[key] = variantName;
        }

        return results; // { original: '...', thumbnail: '...', ... }
    } catch (error) {
        console.error('Image processing error:', error);
        throw new Error('Erreur lors du traitement de l\'image');
    }
}

/**
 * Supprime les fichiers images associés
 * @param {Object} variants - Objet contenant les noms de fichiers { original: '...', ... }
 * @param {string} dir - Dossier contenant les images
 */
async function deleteImages(variants, dir) {
    if (!variants) return;

    const deletions = Object.values(variants).map(filename => {
        if (!filename) return Promise.resolve();
        return fs.unlink(path.join(dir, filename)).catch(err => {
            console.warn(`Failed to delete image ${filename}:`, err.message);
        });
    });

    await Promise.all(deletions);
}

module.exports = {
    processImage,
    deleteImages,
    VARIANTS
};
