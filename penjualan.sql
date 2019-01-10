create database penjualan;

use penjualan;

create table pelanggan(
	kode_pelanggan varchar(10) primary key,
	nama varchar(100)
);

create table barang(
	kode_barang varchar(10) primary key,
	nama_barang varchar(100),
	harga int
);

create table transaksi(
	no_faktur varchar(10) primary key,
	kode_pelanggan varchar(10),
	kode_barang varchar(10),
	qty int,
	tgl date
);

alter table transaksi add foreign key(kode_pelanggan)
references pelanggan(kode_pelanggan);

alter table transaksi add foreign key(kode_barang)
references barang(kode_barang);

insert into pelanggan(kode_pelanggan,nama)
values
('P-001','Kurun'),
('P-002','Theo');

insert into barang(kode_barang,nama_barang,harga)
values
('B-001','Sabun','12000'),
('B-002','Kopi','15000'),
('B-003','Teh','7000');

insert into transaksi(no_faktur,kode_pelanggan,kode_barang,qty,tgl)
values
('F-001','P-001','B-001','5','2019-01-25'),
('F-002','P-001','B-002','6','2019-01-24'),
('F-003','P-002','B-002','3','2019-01-26'),
('F-004','P-002','B-003','7','2019-01-27');

#join

select no_faktur, transaksi.kode_pelanggan, pelanggan.nama, transaksi.kode_barang, barang.nama_barang, barang.harga, qty, qty * barang.harga as total_harga, tgl from transaksi
left join pelanggan on transaksi.kode_pelanggan = pelanggan.kode_pelanggan
left join barang on transaksi.kode_barang = barang.kode_barang;

select no_faktur, transaksi.kode_pelanggan, pelanggan.nama, transaksi.kode_barang, barang.nama_barang, barang.harga, qty, qty * barang.harga as total_harga, tgl
from transaksi
left join pelanggan on transaksi.kode_pelanggan = pelanggan.kode_pelanggan
left join barang on transaksi.kode_barang = barang.kode_barang
where day(tgl) between 24 and 25;