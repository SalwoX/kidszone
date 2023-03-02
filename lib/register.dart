
import 'package:get_it/get_it.dart';
// ignore: implementation_imports
import 'package:provider/single_child_widget.dart';

// import 'register.config.dart';

GetIt resolve = GetIt.instance;

// @InjectableInit(
//   initializerName: r'$initGetIt', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
// )
// @InjectableInit(generateForDir: ['repository', 'core'])
// void configureDependencies() => $initGetIt(resolve);

//** */
//**!registerFactory ise ViewModels tarafında çalışmak için uygun bir register tipi.
//UI ile çalışıldığında birden fazla widget için birden fazla nesneye ihtiyacımız oluyor.
//Her çağrı yapıldığında yeni bir nesne yaratılıyor ve işi bittiğinde dispose ediliyor.
// Örneğin bir ChangeNotifier’dan türettiğiniz bir provider sınıfınız var.
//Bunu factory olarak register etmeniz gerekiyor. */
//**! registerLazySigleton
//Lazy loading ile kaydedilen servisler uygulamanın başlangıcında
// initialize edilmek yerine ilk çağrıldığında initialize oluyor.
// Çok fazla servisle çalışıyorsanız servisleri lazy olarak
//kaydetmeniz performans açısından çok daha akıllıca olacaktır.
//**! registerSigneletonAsync Async kayıtlar ise tahmin edebileceğiniz gibi kayıt sırasında asenkron
//işlemler yapabileceğiniz bir tip. Bunu kendi içinde veya dışında asenkron
//bağımlılıkları olan sınıflara uygulayabilirsiniz.
// */
//***/
void setupRegister() {
  
  //resolve.registerLazySingleton(() => RepositoryBase<DuyurularAraModel>());
  /*
  resolve.registerLazySingleton(() => ApiServices());
  resolve.registerLazySingleton(() => rep.RepositoryCommon());
  resolve.registerLazySingleton(() => rep.RepositoryDuyuru());
  resolve.registerLazySingleton(() => rep.RepositoryLogin());
  resolve.registerLazySingleton(() => rep.RepositoryOkul());
  resolve.registerLazySingleton(() => rep.RepositorySube());
  resolve.registerLazySingleton(() => rep.RepositoryOnKayit());
  resolve.registerLazySingleton(() => rep.RepositoryOnKayitNotlar());
  resolve.registerLazySingleton(() => rep.RepositoryAnket());
  resolve.registerLazySingleton(() => rep.RepositoryOgrenci());
  resolve.registerLazySingleton(() => rep.RepositoryYemek());
  resolve.registerLazySingleton(() => rep.RepositoryOgretmen());
  resolve.registerLazySingleton(() => rep.RepositoryVeli());
  */
}

// List<BlocProviderSingleChildWidget> blockProviderRegister() {
//   var list = <BlocProviderSingleChildWidget>[
//     BlocProvider(create: (context) => LoginBloc()),
//   ];

//   return list;
// }

// List<SingleChildWidget> providers() {
//   var list = <SingleChildWidget>[
//     ChangeNotifierProvider<ViewModelDailyReportTemplate>(create: (_) => ViewModelDailyReportTemplate()),
//   ];
//   return list;
// }

List<SingleChildWidget> providerRegister() {
  var list = <SingleChildWidget>[];
  return list;
}
