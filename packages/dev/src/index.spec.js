// Copyright 2017-2018 @polkadot/dev authors & contributors
// This software may be modified and distributed under the terms
// of the ISC license. See the LICENSE file for details.

import * as index from './index';

describe('index', () => {
  it('runs the test', () => {
    expect(index).toBeDefined();
  });

  it('runs the echo function', () => {
    expect(
      index.echo('something')
    ).toEqual('something');
  });
});