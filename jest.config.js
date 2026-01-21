module.exports = {
    testEnvironment: 'node',
    // Seuil de couverture requis
    coverageThreshold: {
        global: {
            branches: 70,
            functions: 70,
            lines: 70,
            statements: 70,
        },
    },
    // Fichiers de setup
    setupFilesAfterEnv: ['<rootDir>/api-v2/__tests__/setup.js'],
    // Pattern de recherche des tests
    testMatch: ['**/__tests__/**/*.test.js'],
    // Ignorer node_modules et build
    testPathIgnorePatterns: ['/node_modules/', '/build/'],
    // Collecte de couverture
    collectCoverageFrom: [
        'api-v2/**/*.{js,jsx}',
        '!api-v2/config/**', // Config files often hard to test completely or just constants
        '!api-v2/index.js',  // App entry point
        '!**/node_modules/**',
        '!**/vendor/**',
    ],
    // Timeout pour les tests async (10s)
    testTimeout: 10000,
};
