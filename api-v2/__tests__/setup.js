// Configuration globale des tests

// Augmenter le timeout si nécessaire
jest.setTimeout(10000);

// Mock global pour console (pour ne pas polluer la sortie des tests)
// On garde console.error car utile pour le debug des tests eux-mêmes
global.console = {
    ...console,
    log: jest.fn(),
    warn: jest.fn(),
    info: jest.fn(),
    // error: jest.fn(), // On garde error pour voir les pépins
};

// Fermer les connexions DB ouvertes (si on utilisait une vraie DB)
// Ici avec les mocks, c'est moins critique, mais bonne pratique
afterAll(async () => {
    // await pool.end();
});
