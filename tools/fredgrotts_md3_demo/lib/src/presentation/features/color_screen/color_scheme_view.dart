// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/material_design_color_chip.dart';

class ColorSchemeView extends StatelessWidget {
  const ColorSchemeView({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'primary',
                color: colorScheme.primary,
                onColor: colorScheme.onPrimary,
              ),
              MaterialDesignColorChip(
                label: 'onPrimary',
                color: colorScheme.onPrimary,
                onColor: colorScheme.primary,
              ),
              MaterialDesignColorChip(
                label: 'primaryContainer',
                color: colorScheme.primaryContainer,
                onColor: colorScheme.onPrimaryContainer,
              ),
              MaterialDesignColorChip(
                  label: 'onPrimaryContainer',
                  color: colorScheme.onPrimaryContainer,
                  onColor: colorScheme.primaryContainer,
                ),
              
            ],
          ),
        ),
        divider,
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'secondary',
                color: colorScheme.secondary,
                onColor: colorScheme.onSecondary,
              ),
              MaterialDesignColorChip(
                label: 'onSecondary',
                color: colorScheme.onSecondary,
                onColor: colorScheme.secondary,
              ),
              MaterialDesignColorChip(
                label: 'secondaryContainer',
                color: colorScheme.secondaryContainer,
                onColor: colorScheme.onSecondaryContainer,
              ),
              MaterialDesignColorChip(
                  label: 'onSecondaryContainer',
                  color: colorScheme.onSecondaryContainer,
                  onColor: colorScheme.secondaryContainer,
                ),
              
            ],
          ),
        ),
        divider,
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'tertiary',
                color: colorScheme.tertiary,
                onColor: colorScheme.onTertiary,
              ),
              MaterialDesignColorChip(
                label: 'onTertiary',
                color: colorScheme.onTertiary,
                onColor: colorScheme.tertiary,
              ),
              MaterialDesignColorChip(
                label: 'tertiaryContainer',
                color: colorScheme.tertiaryContainer,
                onColor: colorScheme.onTertiaryContainer,
              ),
              MaterialDesignColorChip(
                label: 'onTertiaryContainer',
                color: colorScheme.onTertiaryContainer,
                onColor: colorScheme.tertiaryContainer,
              ),
            ],
          ),
        ),
        divider,
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'error',
                color: colorScheme.error,
                onColor: colorScheme.onError,
              ),
              MaterialDesignColorChip(
                label: 'onError',
                color: colorScheme.onError,
                onColor: colorScheme.error,
              ),
              MaterialDesignColorChip(
                label: 'errorContainer',
                color: colorScheme.errorContainer,
                onColor: colorScheme.onErrorContainer,
              ),
              MaterialDesignColorChip(
                  label: 'onErrorContainer',
                  color: colorScheme.onErrorContainer,
                  onColor: colorScheme.errorContainer,
                ),
              
            ],
          ),
        ),
        divider,
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'background',
                color: colorScheme.background,
                onColor: colorScheme.onBackground,
              ),
              MaterialDesignColorChip(
                label: 'onBackground',
                color: colorScheme.onBackground,
                onColor: colorScheme.background,
              ),
            ],
          ),
        ),
        divider,
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'surface',
                color: colorScheme.surface,
                onColor: colorScheme.onSurface,
              ),
              MaterialDesignColorChip(
                label: 'onSurface',
                color: colorScheme.onSurface,
                onColor: colorScheme.surface,
              ),
              MaterialDesignColorChip(
                label: 'surfaceVariant',
                color: colorScheme.surfaceVariant,
                onColor: colorScheme.onSurfaceVariant,
              ),
              MaterialDesignColorChip(
                  label: 'onSurfaceVariant',
                  color: colorScheme.onSurfaceVariant,
                  onColor: colorScheme.surfaceVariant,
                ),
              
            ],
          ),
        ),
        divider,
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              MaterialDesignColorChip(
                label: 'outline',
                color: colorScheme.outline,
              ),
              MaterialDesignColorChip(
                label: 'shadow',
                color: colorScheme.shadow,
              ),
              MaterialDesignColorChip(
                label: 'inverseSurface',
                color: colorScheme.inverseSurface,
                onColor: colorScheme.onInverseSurface,
              ),
              MaterialDesignColorChip(
                  label: 'onInverseSurface',
                  color: colorScheme.onInverseSurface,
                  onColor: colorScheme.inverseSurface,
                ),
              
              MaterialDesignColorChip(
                label: 'inversePrimary',
                color: colorScheme.inversePrimary,
                onColor: colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
