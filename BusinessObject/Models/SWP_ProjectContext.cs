using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace BusinessObject.Models
{
    public partial class SWP_ProjectContext : DbContext
    {
        public SWP_ProjectContext()
        {
        }

        public SWP_ProjectContext(DbContextOptions<SWP_ProjectContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Food> Foods { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Seller> Sellers { get; set; } = null!;
        public virtual DbSet<Shipper> Shippers { get; set; } = null!;
        public virtual DbSet<Shipping> Shippings { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory())
               .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
                IConfiguration configuration = builder.Build();
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("DB"));
               // optionsBuilder.UseSqlServer("server=localhost;database=SWP_Project;uid=sa;pwd=123;TrustServerCertificate=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.ToTable("Account");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Address).HasMaxLength(50);

                entity.Property(e => e.Displayname).HasMaxLength(50);

                entity.Property(e => e.IsAdmin).HasColumnName("isAdmin");

                entity.Property(e => e.IsCustomer).HasColumnName("isCustomer");

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Username).HasMaxLength(50);
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.CategoryName).HasMaxLength(50);
            });

            modelBuilder.Entity<Food>(entity =>
            {
                entity.Property(e => e.FoodId).HasColumnName("FoodID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.DateCreated).HasColumnType("date");

                entity.Property(e => e.FoodName).HasMaxLength(50);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Foods)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Foods_Category");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.AccountId).HasColumnName("account_id");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("created_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.SellerId).HasColumnName("SellerID");

                entity.Property(e => e.ShipperId).HasColumnName("ShipperID");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_Orders_Account");

                entity.HasOne(d => d.Seller)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.SellerId)
                    .HasConstraintName("FK_Orders_Seller");

                entity.HasOne(d => d.Shipper)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.ShipperId)
                    .HasConstraintName("FK_Orders_Shipper");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("OrderDetail");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_OrderDetail_Orders");
            });

            modelBuilder.Entity<Seller>(entity =>
            {
                entity.HasKey(e => e.SallerId);

                entity.ToTable("Seller");

                entity.Property(e => e.SallerId).HasColumnName("SallerID");

                entity.Property(e => e.AccountId).HasColumnName("AccountID");

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.SallerName).HasMaxLength(50);
            });

            modelBuilder.Entity<Shipper>(entity =>
            {
                entity.ToTable("Shipper");

                entity.Property(e => e.ShipperId).HasColumnName("ShipperID");

                entity.Property(e => e.AccountId).HasColumnName("AccountID");

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.SellerId).HasColumnName("SellerID");

                entity.Property(e => e.ShipperName).HasMaxLength(50);

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.Shippers)
                    .HasForeignKey(d => d.AccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Shipper_Account");

                entity.HasOne(d => d.Seller)
                    .WithMany(p => p.Shippers)
                    .HasForeignKey(d => d.SellerId)
                    .HasConstraintName("FK_Shipper_Seller");
            });

            modelBuilder.Entity<Shipping>(entity =>
            {
                entity.ToTable("Shipping");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Shippings)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_Shipping_OrderDetail");

                entity.HasOne(d => d.OrderNavigation)
                    .WithMany(p => p.Shippings)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_Shipping_Orders");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
