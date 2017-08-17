module.exports = {
  root: true,
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
    ecmaFeatures: {
      experimentalObjectRestSpread: true,
    }
  },
  extends: 'eslint:recommended',
  env: {
    browser: true
  },
  rules: {
    'no-console': [1, {allow: ['warn', 'error']}],
    'no-unused-vars': 1
  }
};

