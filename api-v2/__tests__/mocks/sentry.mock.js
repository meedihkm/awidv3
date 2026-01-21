const mockSentry = {
    Handlers: {
        requestHandler: () => (req, res, next) => next(),
        tracingHandler: () => (req, res, next) => next(),
        errorHandler: () => (err, req, res, next) => next(err),
    },
    init: jest.fn(),
};

module.exports = {
    Sentry: mockSentry,
    initSentry: jest.fn(),
};
