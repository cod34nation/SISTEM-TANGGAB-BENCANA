<?php 
$coba100 = mysqli_query($koneksi, "SELECT * FROM arsip");

?>
<div class="x_title">
                    <h2>Basic Tables <small>basic table subtitle</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <table class="table">
                      <thead>
                        <tr>
                          <th>No Arsip</th>
                          <th>Nama Operasi</th>
                          <th>Tanggal Operasi</th>
                        
                        </tr>
                      </thead>
                      <tbody>
                      <?php
                      while ($row100 = mysqli_fetch_array($coba100)) {
                        ?>
                        <tr>
                          <th scope="row"><?php echo $row100['id_arsip']; ?></th>
                          <td><?php echo $row100['nama_bencana']; ?></td>
                          <td><?php echo $row100['tgl_input']; ?></td>
                      
                        </tr>
                        <?php
                       } 
                      ?>
                        
                      </tbody>
                    </table>

                  </div>
                </div>