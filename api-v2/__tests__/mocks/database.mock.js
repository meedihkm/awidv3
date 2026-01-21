// Mock de la base de données PostgreSQL
// Permet de simuler les réponses de pg sans base de données réelle

const mockQuery = jest.fn();
const mockClient = {
    query: mockQuery,
    release: jest.fn(),
};
const mockConnect = jest.fn().mockResolvedValue(mockClient);

const mockPool = {
    query: mockQuery,
    connect: mockConnect,
    on: jest.fn(),
};

// Reset simple avant chaque test
beforeEach(() => {
    mockQuery.mockReset();
    mockConnect.mockClear();
    mockClient.release.mockClear();
});

module.exports = {
    mockPool,
    mockQuery,
    mockClient,
    mockConnect,
};
