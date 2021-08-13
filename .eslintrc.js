module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: ['prettier'],
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: 'module',
  },
  rules: {
    quotes: ['error', 'single'],
    'prettier/prettier': 'error',
    camelcase: 'error',
    'react/jsx-filename-extension': ['error', { extensions: ['.js', '.jsx'] }],
    'no-underscore-dangle': 'off',
    'no-use-before-define': [
      'error',
      { functions: false, classes: true, variables: false },
    ],
  },
}
