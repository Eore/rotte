CREATE TABLE `karyawan` (
	`badge` varchar(20) NOT NULL,
	`nama` varchar(150) NOT NULL,
	`tgl_masuk` DATE NOT NULL,
	`tgl_lahir` DATE NOT NULL,
	`no_telpon_pribadi` varchar(20) NOT NULL,
	`no_telpon_ayah` varchar(20) NOT NULL,
	`no_telpon_ibu` varchar(20) NOT NULL,
	`daerah_asal` varchar(50) NOT NULL,
	`alamat` varchar(50) NOT NULL,
	`pendidikan` varchar(50) NOT NULL,
	`catatan` varchar(255) NOT NULL,
	PRIMARY KEY (`badge`)
);

CREATE TABLE `log_grade` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`grade` int NOT NULL,
	`tgl_update` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `pelanggaran_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`id_pelanggaran` int NOT NULL,
	`tgl_kejadian` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `pelanggaran` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nama` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `training_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`id_training` int NOT NULL,
	`keterangan` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `training` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nama` varchar(150) NOT NULL,
	`tgl_pelaksanaan` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tindakan_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`tgl_tindakan` DATE NOT NULL,
	`catatan` varchar(255) NOT NULL,
	`status_grade` varchar(10) NOT NULL,
	`status_peringatan` varchar(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `penilaian_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`id_item_penilaian` int NOT NULL,
	`nilai` int NOT NULL,
	`tgl_penilaian` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `item_penilaian_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nama` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_reject_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`tgl_kejadian` DATE NOT NULL,
	`keterangan` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `pengajian_karyawan` (
	`id` int NOT NULL AUTO_INCREMENT,
	`badge` varchar(20) NOT NULL,
	`nama_pengajian` varchar(150) NOT NULL,
	`lokasi_pengajian` varchar(50) NOT NULL,
	`tgl_pengajian` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `pelamar` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nama` varchar(150) NOT NULL,
	`tgl_masuk` DATE NOT NULL,
	`tgl_lahir` DATE NOT NULL,
	`no_telpon_pribadi` varchar(20) NOT NULL,
	`no_telpon_ayah` varchar(20) NOT NULL,
	`no_telpon_ibu` varchar(20) NOT NULL,
	`daerah_asal` varchar(50) NOT NULL,
	`alamat` varchar(50) NOT NULL,
	`pendidikan` varchar(50) NOT NULL,
	`cv` varchar(255) NOT NULL,
	`ijazah` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `log_grade` ADD CONSTRAINT `log_grade_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);

ALTER TABLE `pelanggaran_karyawan` ADD CONSTRAINT `pelanggaran_karyawan_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);

ALTER TABLE `pelanggaran_karyawan` ADD CONSTRAINT `pelanggaran_karyawan_fk1` FOREIGN KEY (`id_pelanggaran`) REFERENCES `pelanggaran`(`id`);

ALTER TABLE `training_karyawan` ADD CONSTRAINT `training_karyawan_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);

ALTER TABLE `training_karyawan` ADD CONSTRAINT `training_karyawan_fk1` FOREIGN KEY (`id_training`) REFERENCES `training`(`id`);

ALTER TABLE `tindakan_karyawan` ADD CONSTRAINT `tindakan_karyawan_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);

ALTER TABLE `penilaian_karyawan` ADD CONSTRAINT `penilaian_karyawan_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);

ALTER TABLE `penilaian_karyawan` ADD CONSTRAINT `penilaian_karyawan_fk1` FOREIGN KEY (`id_item_penilaian`) REFERENCES `item_penilaian_karyawan`(`id`);

ALTER TABLE `product_reject_karyawan` ADD CONSTRAINT `product_reject_karyawan_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);

ALTER TABLE `pengajian_karyawan` ADD CONSTRAINT `pengajian_karyawan_fk0` FOREIGN KEY (`badge`) REFERENCES `karyawan`(`badge`);
