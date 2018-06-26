// Copyright 2017-2018 @polkadot/dev authors & contributors
// This software may be modified and distributed under the terms
// of the ISC license. See the LICENSE file for details.

const { defaults } = require('jest-config');

module.exports = {
  transform: {
    '^.+\\.(js|jsx|ts|tsx)$': 'babel-jest'
  },
  moduleFileExtensions: [
    'ts', 'tsx', ...defaults.moduleFileExtensions
  ],
  verbose: true
};