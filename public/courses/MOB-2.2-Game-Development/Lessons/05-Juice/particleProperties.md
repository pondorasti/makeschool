- particleTexture: The texture to use for each particle. The default value is nil, and if you don’t set a texture, the emitter uses a colored rectangle to draw the particle.

- particleBirthRate: The rate at which the emitter generates the particles per second. It defaults to 0.0. If you leave the birth rate at 0.0, the emitter won’t generate any particles.

- numParticlesToEmit: The number of particles the emitter will generate before stopping. The default value is 0, which means the emitter will generate an endless stream of particles.

- particleLifetime: The duration of time, in seconds, that each particle is active. The default value is 0.0; if you don’t change this, the emitter won’t generate any particles.

- emissionAngle: The angle from which the particles are emitted. The default value is 0.0, which is directly right.

- emissionAngleRange: The range of randomness of the emission angle, which varies plus or minus half the range value.

- particleSpeed: The initial speed for a new particle in points per second. The default value is 0.0.

- particleSpeedRange: The range of randomness of the particle speed that varies plus or minus half the range value. The default value is 0.0.

- particleAlpha: The average starting alpha value for each particle, which determines the transparency of your particles. The default value is 1.0, which is fully opaque.

- particleAlphaRange: The range of randomness of the particle alpha, which varies plus or minus half the range value. The default value is 0.0; you set it to 0.25 which makes some of the particles slightly transparent.

- particleScale: The scale at which the emitter renders each particle. The default value is 1.0, which is full size. Values greater than 1.0 scale up the particles while values less than 1.0 scale them down.

- particleScaleRange: The range of randomness of the particle scale, which varies plus or minus half the range value.

- particleScaleSpeed: The rate at which a particle’s scale factor changes per second. The default value is 0.0.

- particleColor: The color the emitter blends with the particle texture.The default value is SKColor.clear.

- particleColorBlendFactor: The amount of color the emitter applies to the texture when rendering each particle.

- particleBlendMode: The blending mode used to blend particles with the other colors onscreen. The default value is SKBlendMode.alpha, which means that the particles and other objects are blended by multiplying the particles’ alpha values.

Source: 2D Apple Games by Tutorials
