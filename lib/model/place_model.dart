class PlaceInfo {
  final String location, image, name, desc;
  final int distance, days;

  PlaceInfo({
    required this.image,
    required this.name,
    required this.location,
    required this.distance,
    required this.days,
    required this.desc,
  });
}

List places = [
  PlaceInfo(
      image: "assets/images/borobudur.jpg",
      name: "Candi Borobudur",
      location: "Jawa Tengah",
      distance: 5000,
      days: 12,
      desc:
          "Candi legendaris ini diperkirakan dibangun pada abad ke-8, tepatnya sekitar tahun 750-an masehi pada masa pemerintahan dinasti Syailendra. Pembangunannya diperkirakan berlangsung sekitar 75 tahun sampai akhirnya rampung pada saat pemerintahan raja Samaratungga berlangsung. Candi Borobudur terletak diatas bukit hijau yang asri di mana Sobat Pesona bisa menyaksikan bukit-bukit hijau lain di sekitarnya. Bangunannya sendiri terdiri atas jutaan blok batu yang dibuat kedalam tiga struktur yang menggambarkan tingkatan alam semesta menurut filsafat Buddha. Bangunan kolosal ini juga dihiasi oleh 2.672 panel relief dan 504 patung Buddha. Terjadinya erupsi Gunung Merapi yang dahsyat pada sekitar tahun 1006 menyebabkan Candi Borobudur tertimbun oleh debu vulkanik selama ratusan tahun lamanya. Beberapa abad kemudian, Candi Borobudur akhirnya ditemukan kembali pada tahun 1814 oleh seorang insinyur Belanda bernama Hermanus Christiaan Cornelius, ketika kerajaan Inggris yang diwakili oleh Thomas Stamford Raffles menduduki beberapa bagian pulau Jawa, termasuk Jawa Tengah. Setelah Indonesia merdeka, pada akhir tahun 60-an pemerintah bekerja sama dengan UNESCO untuk merenovasi Candi Borobudur selama bertahun-tahun, sampai akhirnya UNESCO menetapkan mahakarya agung tersebut sebagai Situs Warisan Dunia di tahun 1991."),
  PlaceInfo(
      image: "assets/images/nusapenida.jpg",
      name: "Nusa Penida",
      location: "Bali",
      distance: 12000,
      days: 7,
      desc:
          "Nusa Penida adalah pulau indah di sebelah tenggara Bali, Indonesia, terkenal dengan pantai-pantai spektakuler seperti Kelingking Beach dan Angel's Billabong. Pulau ini menawarkan keindahan alam, tebing tinggi, dan air laut yang jernih. Selain itu, Nusa Penida juga memiliki budaya lokal yang kaya dan merupakan tempat konservasi burung elang Bali. Jaraknya dapat dijangkau dengan perahu dari Bali, menjadikannya suatu objek wisata yang banyak diminati oleh banyak orang, dengan menawarkan keindahan bawah laut Lihat Selengkapnya"),
  PlaceInfo(
      image: "assets/images/bromo.jpg",
      name: "Gunung Bromo",
      location: "Jawa Timur",
      distance: 8000,
      days: 3,
      desc:
          "Gunung Bromo atau dalam bahasa Tengger dieja 'Brama', juga disebut Kaldera Tengger, adalah sebuah gunung berapi aktif di Jawa Timur, Indonesia. Gunung ini memiliki ketinggian 2.329 meter di atas permukaan laut dan berada dalam empat wilayah kabupaten, yakni Kabupaten Probolinggo, Kabupaten Pasuruan, Kabupaten Lumajang, dan Kabupaten Malang. Gunung Bromo terkenal sebagai objek wisata utama di Jawa Timur. Sebagai sebuah objek wisata, Bromo menjadi menarik karena statusnya sebagai gunung berapi yang masih aktif. Gunung Bromo termasuk dalam kawasan Taman Nasional Bromo Tengger Semeru. Nama Bromo berasal dari nama dewa utama dalam agama Hindu, Brahma. Bentuk tubuh Gunung Bromo bertautan antara lembah dan ngarai dengan kaldera atau lautan pasir seluas sekitar 10 kilometer persegi, Ia mempunyai sebuah kawah dengan garis tengah ± 800 meter (utara-selatan) dan ± 600 meter (timur-barat). Sedangkan daerah bahayanya berupa lingkaran dengan jari-jari 4 km dari pusat kawah Bromo"),
];
