import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies_providers.dart';

final initialLoadingProviders = Provider<bool>(
  (ref) {
     final step1 = ref.watch(moviesSlideshowProvider).isEmpty;
    final step2 = ref.watch(popularMovieProvider).isEmpty;
    final step3 = ref.watch(topRatedMovieProvider).isEmpty;
    final step4 = ref.watch(upComingMovieProvider).isEmpty;

    if (step1 || step2 || step3 || step4 ) return true;
    
    return false;
  },
);
